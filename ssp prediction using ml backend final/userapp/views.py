from django.shortcuts import render,redirect
from django.contrib import messages
from mainapp.models import User
import pandas as pd
from pickle import load
from userapp.models import * 
# Create your views here.
def user_login(req):
    if req.method=="POST":
        email=req.POST.get("email")
        password=req.POST.get("password")
        print(email,password)
        try:
            user=User.objects.get(Email=email,Password=password)
            if user.status == "pending":
                messages.info(req,'Your account is on pending')
                return redirect('user_login')
            
            req.session["user_id"]=user.user_id
            messages.success(req,'Logged in successfully :)')
            return redirect('dashboard')
        except:
            messages.warning(req,'incorrect details')
            return redirect('user_login')
        
    return render(req,'main_template/user-login.html')

def user_dashboard(request):
    return render(request,'user_template/user-dashboard.html')

def prediction(request):
    conclusion = ''
    
    if request.method=="POST":
        
        investors = request.POST.get('investors')
        Participents  = request.POST.get('Participents')
        Participents = float(Participents)
        Competitors  = request.POST.get('Competitors')
        Partnerships  = request.POST.get('Partnerships')
        Founders  = request.POST.get('Founders')
        Vc  = request.POST.get('ve')
        Vc = int(Vc)

        Relationships  = request.POST.get('Relationships')
        Relationships = int(Relationships)

        Funding = request.POST.get('Funding')
        Funding = int(Funding)

        Angel  = request.POST.get('angel')
        Angel = int(Angel)

        Software = request.POST.get('Software') 
        Web = request.POST.get('Web') 
        Mobile = request.POST.get('Mobile') 
        Advertising = request.POST.get('Advertising') 
        Games = request.POST.get('Games') 
        commerce = request.POST.get('commerce') 
        Biotech = request.POST.get('Biotech') 
        enterprise = request.POST.get('enterprise') 
        Consulting = request.POST.get('Consulting') 
        Other = request.POST.get('Other') 
        a = request.POST.get('a') 
        b = request.POST.get('b') 
        c = request.POST.get('c') 
        d = request.POST.get('d') 
        funding_rounds =  request.POST.get('fr') 
        funding_rounds = int(funding_rounds)

        top = request.POST.get('top') 
        top = int(top)

        Time = request.POST.get('timing')
        Market = request.POST.get('Market')
        if Software ==None:
            Software = 0
        else:
            Software = 1
        if Web ==None:
            Web = 0
        else:
            Web = 1
        if Mobile ==None:
            Mobile = 0
        else:
            Mobile = 1
        if Advertising ==None:
            Advertising = 0
        else:
            Advertising = 1
        if Games ==None:
            Games = 0
        else:
            Games = 1
        if commerce ==None:
            commerce = 0
        else:
            commerce = 1
        if Biotech ==None:
            Biotech = 0
        else:
            Biotech = 1
        if Consulting ==None:
            Consulting = 0
        else:
            Consulting = 1
        if enterprise ==None:
            enterprise = 0
        else:
            enterprise = 1
        if Other ==None:
            Other = 0
        else:
            Other = 1
        if a ==None:
            a = 0
        else:
            a = 1
        if b ==None:
            b = 0
        else:
            b = 1
        if c ==None:
            c = 0
        else:
            c = 1
        if d ==None:
            d = 0
        else:
            d = 1
        
        print(a,'aaaa',type(a))
        data = {
            'relationships': Relationships,
            'funding_rounds': funding_rounds,
            'funding_total_usd': Funding,
            'is_software': Software,
            'is_web': Web,
            'is_mobile': Mobile,
            'is_enterprise': enterprise,
            'is_advertising': Advertising,
            'is_gamesvideo': Games,
            'is_ecommerce': commerce,
            'is_biotech': Biotech,
            'is_consulting': Consulting,
            'is_othercategory': Other,
            'has_VC': Vc,
            'has_angel': Angel,
            'has_roundA': a,
            'has_roundB': b,
            'has_roundC': c,
            'has_roundD': d,
            'avg_participants': Participents,
            'is_top500': top,
        }
        df = pd.DataFrame(data, index=[0])
        print(df.head())
        print(df.columns)
        model = load(open('AdaBoostClassifier.pkl','rb'))
        prediction=model.predict(df)
        predictio = prediction[0][0]
        Competitors = int(Competitors)
        if predictio == 0:
            result = 'Acquired'
            conclusion += 'Our prediction says that your startup will hopefully be a Success.'
            if Competitors > 3:
                conclusion += 'Forget about your competitors just focus on your customers'
                
        elif predictio == 1:
            result = 'Closed'
            conclusion += 'Our prediction says that your startup might fail.'
            if Relationships<2:
                conclusion += 'As relationships are less, start relationships, you will definitely succeed'
            if funding_rounds<2:
                conclusion += 'As funding_rounds are less, try to increse funding rounds then you will definitely succeed'
            if Time == 'no':
                conclusion += 'Try to enter the market at the right time'
            if Market == 'no':
                conclusion += 'Select a product or problem statement that has a huge demand in the market'
            
            if Competitors > 3:
                conclusion += 'Forget about your competitors just focus on your customers'
        print(conclusion,'conclusion')

        print(predictio,result,'result')
        predictid = Predict.objects.create(
            investors=investors,
            Competitors=Competitors,
            Partnerships=Partnerships,
            Founders=Founders,
            Time = Time,
            Market = Market,
            Relationships  = Relationships,
            funding_rounds  = funding_rounds,
            Funding  = Funding,
            Software  = Software,
            Web  = Web,
            Mobile  = Mobile,
            enterprise  = enterprise,
            Advertising  = Advertising,
            Games  = Games,
            commerce  = commerce,
            Biotech  = Biotech,
            Consulting  = Consulting,
            Other  = Other,
            Vc  = Vc,
            Angel  = Angel,
            a  = a,
            b  = b,
            c  = c,
            d  = d,
            Participents  = Participents,
            top  = top,
            result = result,
            conclusion = conclusion

        )
        id =predictid.predict_id
        return redirect('prediction_results',id)
    return render(request,'user_template/startup-prediction.html')

def user_profile(request):
    # sourcery skip: extract-method, hoist-statement-from-if
    userid=request.session["user_id"]
    usser=User.objects.get(user_id=userid)
    context={"i":usser}
    if request.method == "POST":
        fullname=request.POST.get("fullname")
        email=request.POST.get("email")
        phone=request.POST.get("phone")
        password=request.POST.get("password")
        city=request.POST.get("city")
        industry=request.POST.get("industry")
        state=request.POST.get("state")
        if len(request.FILES)!=0:
            image=request.FILES["img"]
            usser.Fullname=fullname
            usser.Email=email
            usser.Phone=phone
            usser.Password=password
            usser.city=city
            usser.industry=industry
            usser.image=image  
            usser.state=state         
            usser.save()
            print(fullname,email,email,phone,password,city,industry,image,state)
            messages.info(request,'Details Updated!')
            return redirect('user_profile')
        else:
            usser.Fullname=fullname
            usser.Email=email
            usser.Phone=phone
            usser.Password=password
            usser.city=city
            usser.industry=industry 
            usser.state=state         
            usser.save()
            print(fullname,email,email,phone,password,city,industry,state)
            messages.info(request,'Details Updated!')
            return redirect('user_profile')   
    return render(request,'user_template/user-profile.html',context)

def user_logout(request):
    messages.info(request,'You have been logged out :( ')
    return redirect('user_login')