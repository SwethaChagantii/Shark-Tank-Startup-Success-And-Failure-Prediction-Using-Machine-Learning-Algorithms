from django.db import models

# Create your models here.
class Predict(models.Model):
    predict_id = models.AutoField(primary_key=True)
    Participents = models.FloatField(null=True)
    Vc = models.IntegerField(null=True)
    Relationships = models.IntegerField(null=True)
    Funding = models.IntegerField(null=True)
    Angel = models.IntegerField(null=True)
    funding_rounds = models.IntegerField(null=True)
    top = models.IntegerField(null=True)
    Software = models.IntegerField(null=True)
    Web = models.IntegerField(null=True)
    Mobile = models.IntegerField(null=True)
    Advertising = models.IntegerField(null=True)
    Games = models.IntegerField(null=True)
    commerce = models.IntegerField(null=True)
    Biotech = models.IntegerField(null=True)
    Consulting = models.IntegerField(null=True)
    enterprise = models.IntegerField(null=True)
    Other = models.IntegerField(null=True)
    a = models.IntegerField(null=True)
    b = models.IntegerField(null=True)
    c = models.IntegerField(null=True)
    d = models.IntegerField(null=True)
    investors = models.CharField(max_length=500,null=True)
    Competitors = models.IntegerField(null=True)
    Partnerships = models.CharField(max_length=500,null=True)
    Founders = models.CharField(max_length=500,null=True)
    Time = models.CharField(max_length=500,null=True)
    Market = models.CharField(max_length=500,null=True)
    result = models.CharField(max_length=500,null=True)
    conclusion = models.CharField(max_length=1000,null=True)

    class Meta:
        db_table = 'prredict_details'