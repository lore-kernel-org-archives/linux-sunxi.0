Received: from mail-yw1-f227.google.com (mail-yw1-f227.google.com [209.85.128.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8013A3A875D
	for <linux-sunxi@lists.linux.dev>; Fri, 10 Apr 2026 21:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.227
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775855090; cv=pass; b=UTmmIhJEswh+3kMrfBVNQEhLf5vdVnh7gCJost3Qsjx2GIVMOeaoDerGQSwOrdNyYq2Nejg79nBBBWLvvjCfLZkVP6MGaCMZvUdZZASr9vz96lqgWT14P/Lrj1yfP9v000wAcC2rwB3xDlkekXMC5udIseB0Eyj3jrKBjbh0/p0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775855090; c=relaxed/simple;
	bh=bXjSAien4GLroks2+9nbQS2U90LmTi5bkTh8KCMYykU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cT4m9RC8OQCuXOqZg8DquxGQf2UK27JMkRwneWOS7JP1GqRPG7uFX3dvPhRT33aAohfHcFq9NILUT7tNViSkRA0YOH/Ff6tfp8+I+exMvwa4WvGPg3ZqBStdbwzFNsHPT0BPLKKqfXSPS8ECQLDfEDThOoscVfWJk5NrQiCecI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=ZYMUrjtx; arc=pass smtp.client-ip=209.85.128.227
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="ZYMUrjtx"
Received: by mail-yw1-f227.google.com with SMTP id 00721157ae682-79a60975dc5so28706227b3.0
        for <linux-sunxi@lists.linux.dev>; Fri, 10 Apr 2026 14:04:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775855087; x=1776459887;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6YHaoB6NzDNgJmLZXYapxh8KlkebRoiZAxL+jf+CLSo=;
        b=iUk03zwH4T5RLWdxcVDBZKFutlp0cIydFPlj+cpHflrLSS3KczPutQ97W8bbG55hr1
         ZZnOScj15p4CgqMWsFGVmg7DP1KhgWMQ6w5PV4D+DaQpin0/v2vnIuWb+M5iJkXxQdWt
         78y2fBz7Q4tZb+nYNr9oq35uPSnt7zUWbfnGmnWwmgJxpbdUoIDx1FuNrAqWeH6Ya4el
         bM9El90yFYp+fnu5A9sKIq1nibPPy2/O10lc4Fhk3UISCk+/CL+ZO0vX/ZDWCbaqP+dK
         katjYMFXWHALGAeQJo4U1sgrL7yorMhB/x2jwFP6X9ctdaTtYCL+48B/NE2B1tXWJ88L
         zbLA==
X-Forwarded-Encrypted: i=2; AJvYcCW6O6aGcDFF3nc8MHASAQzXRLh9+sehqKB5TGmPNP+g5QfePs7l2TIIpwewl9/ApOZbX4vdUEC37sf/iw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyd/3tzO4d11ug2wYG0cnMGPa/GJ75rRRzcNj3jlaKYYZi/hkaD
	KlVRjSP58BTMS3C2wFWWnRbnNoSResRQ4fD3sFNIOoLhtpGJ1nniG6PsULsyipJaT4M0OopCgVo
	LL0Tu4s1rCTA3ZX8w0lVL8ChnPMuXqMk1RZC1Rz4VlEygkToUSDyaRCURXzJgn1Sl8UGVBVbexM
	DthA3U2h2LnnkNEOlXFFZ+V7auNJnHEYbszPUEwPySlLWJ1atNHajwHTsuIxTauS0PoAADbvcon
	gBguJLNEAUpImbULFDYxqpX
X-Gm-Gg: AeBDietTuVLzmYSJq3bGX4CxCTC1UR/AQcSUcS/Z5QzzcjfKOa9AnGbcSeWh7x4Avrv
	nxwv0Xa99JxLN3gTPvtqYHm7OIuOOSmMbZgkcWKUO2rF/WVouzYD5pO+DDfAU74Ra3d5UJE2zEW
	6MoWeE9nCAME8867u6Yil+meZEP8R8j9s+cqCa+c1qro6ygupl2d5l77KrASwBCoFAvmWW/jGUc
	YhrjO0b1pVwxgINJRmxm68ZB0T3LOOG6W6rcGao7wAAdaSZdSaNP8DvVe4BWuhkzI61uW3Y9j3B
	ofFTaUCT25xeHU4dWYI8m275JOFenK9PacuZLDtRxG+CVSH17xyEy8cUkZyOl7qhJa0jKHL5Gwj
	H9cDZj/GUvJkn3c1J/P5YSjeDGY2KDsQWj1j9GITQqyyWnXEAnEzk+loErIlB+Z7q2Z9MxQYlcz
	USR7cv48U+ATQwKqZzVxhnx3S7enZ0mjKFBAylZ9SPuNBdctbydbQExv1+FO5jvTc=
X-Received: by 2002:a05:690c:4c0b:b0:7ac:24ba:3e36 with SMTP id 00721157ae682-7af7157893emr54825847b3.27.1775855087314;
        Fri, 10 Apr 2026 14:04:47 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-24.dlp.protect.broadcom.com. [144.49.247.24])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-7af3e565bcfsm2421327b3.2.2026.04.10.14.04.46
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Apr 2026 14:04:47 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d1bfbd219so1832664f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 10 Apr 2026 14:04:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775855086; cv=none;
        d=google.com; s=arc-20240605;
        b=B5yD6c/pzrCo/z7dFspZB2AuS2rXb3skXDeyhPXDLVZo2skerJ5A2h24OIITiO3mDA
         POXkyuatDxSV69UdO2LaIKuNDXueXtSnmFoJue2kkCY7aBrJ/vsGadGCIv6x7CKNnndx
         JBBPb28QXpQNy0g1jC2qkov2IuY0WN+GUQgsoe06GDX6hk1WP8XGvmNg+JafqY10wahV
         WW39f4zon2EIZUC3XAR2L7MZ++omZcoWb8obirXi3oE07xeP+HdfkUtWJRVoiv1pu7f7
         tKPnVGBpVMu1xSoS5STdY2cvmbD9aWRtsTLIKx6kkL05mork/XgzsF3a7X6+YrUrfWEF
         v5kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6YHaoB6NzDNgJmLZXYapxh8KlkebRoiZAxL+jf+CLSo=;
        fh=y+E5NVxxvIbSJL4vupsIqq4dSoZ3+eNr74a39V1XjMQ=;
        b=HT4Jv08FAWe3tPlWLqBN7bLD86Vdvm6YjM8Fr6s3R7CsIwdeuSKgzGNVndk3V1CO+2
         E0p4j3qnHIMlFt6GomKuX85Z1Lcwv/O1gevpncTs07nlSQ6FkyczsHZC7XnPXj8eRRwj
         zkmQEEy3dn+gOPepEsDbBUloPbaQgorUET5Uag/rHUTiZlTUML949miHBeleHuRaDurW
         xTUEUaO/q1sMHjoJwW7xCbp764+OdVT5Vs7qAN9yXAThTKqcxIQnhlhG85ZMHMQuQh0P
         ryf2Km1mODGuHX2jzCyffoB2phg7ReH/Qap7+vCMT9kXFNUYNbrGh3UjJxei3elaDa3U
         wZrQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1775855086; x=1776459886; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6YHaoB6NzDNgJmLZXYapxh8KlkebRoiZAxL+jf+CLSo=;
        b=ZYMUrjtxX3ZF29DUPZOia0YoZ0Y9lnc8GmQh0pgXu44FXsDr5yTYy1FR4i5RN1mO1M
         ZhN+WJLKeHqCdM5sZ9EAeTnB2FrJEyweNNR7UqkE76WRYk5pYMLJPs53fOPbK3UKSj5V
         8Hur5wof/aqSkFN2H8AdjiUuRnob5K+ZLadD8=
X-Forwarded-Encrypted: i=1; AJvYcCXIyomG+zAMbLrFthk/LRs3Wlp5p+eEj/kkT7CxmTZc5k/Wi4VuQiNTYp2Kqes7UvDnSVAX+wQwxwZaUA==@lists.linux.dev
X-Received: by 2002:a05:6000:2906:b0:439:fbbc:d593 with SMTP id ffacd0b85a97d-43d642c7a90mr6978484f8f.27.1775855085640;
        Fri, 10 Apr 2026 14:04:45 -0700 (PDT)
X-Received: by 2002:a05:6000:2906:b0:439:fbbc:d593 with SMTP id
 ffacd0b85a97d-43d642c7a90mr6978440f8f.27.1775855085044; Fri, 10 Apr 2026
 14:04:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <adYfPBHsXxQUsMyr@shell.armlinux.org.uk> <E1wAPBR-0000000F7ju-1fD9@rmk-PC.armlinux.org.uk>
 <CAMdnO-+TK65AxjTsDd017Mhop+VC3Xf8jtfaTXYpE6wBNZOt4g@mail.gmail.com> <adi3Vks-N0a83ylE@shell.armlinux.org.uk>
In-Reply-To: <adi3Vks-N0a83ylE@shell.armlinux.org.uk>
From: Jitendra Vegiraju <jitendra.vegiraju@broadcom.com>
Date: Fri, 10 Apr 2026 14:04:32 -0700
X-Gm-Features: AQROBzA8eu5WjtBEGnB0inAkAMz407HE65PW9MMqp4ETiWDYykwhH2trVnWL8Yg
Message-ID: <CAMdnO-KLJrbTxaXrfs_s1G=rn0PjSrQ3cdYHjrnmvXdPJ7=B9Q@mail.gmail.com>
Subject: Re: [PATCH RFC net-next 02/10] net: stmmac: rename dev_id to userver
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sunxi@lists.linux.dev, 
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, 
	Samuel Holland <samuel@sholland.org>
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000009389ea064f217b2c"

--0000000000009389ea064f217b2c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 10, 2026 at 1:39=E2=80=AFAM Russell King (Oracle)
<linux@armlinux.org.uk> wrote:
>
> On Thu, Apr 09, 2026 at 04:07:42PM -0700, Jitendra Vegiraju wrote:
> > Hi Russell,
> >
> > On Wed, Apr 8, 2026 at 2:27=E2=80=AFAM Russell King (Oracle)
> > <rmk+kernel@armlinux.org.uk> wrote:
> > >
> > > The Synopsys Databook and several implementation TRMs identify bits
> > > 15:8 of the version register in dwmac v3.xx and v4.xx as "userver".
> > > We even print its value with "User ID". Rather than using "dev_id",
> > > use "userver" instead.
> > >
> > > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> > > ---
> > >  drivers/net/ethernet/stmicro/stmmac/hwif.c | 18 +++++++++---------
> > >  1 file changed, 9 insertions(+), 9 deletions(-)
> > >
> > > diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net=
/ethernet/stmicro/stmmac/hwif.c
> > > index 3774af66db48..830ff816ab4f 100644
> > > --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > > +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> > > @@ -15,7 +15,7 @@
> > >
> > >  struct stmmac_version {
> > >         u8 snpsver;
> > > -       u8 dev_id;
> > > +       u8 userver;
> > >  };
> > From the XGMAC databook that I have access to bits(15:8) identify the
> > DEVID field of MAC_version register.
> > The userver field is from bits(23:16) of the same register. This is a
> > customer defined field (configured with coreConsultant).
> > Currently stmmac doesn't care about bits(23:16).
>
> Thanks for the additional information.
>
> I don't have any XGMAC documentation, but this indicates that it differs
> between XGMAC and previous cores - GMAC and GMAC4 cores, 15:8 are
> documented as userver, and 31:16 are marked as reserved.
>
> Note that the dev_info() also prints 15:8 as "User ID" not "Device ID".
>
> To confirm, is the XGMAC version register at offset 0x20 ? Later GMAC
> cores moved it to 0x110.
The XGMAC version register is at offset 0x110.

>
> --
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

--0000000000009389ea064f217b2c
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
tJVewHuOmXgWQxNWV7Oiszu1d9xAcqyj65s1PrEIIaHnxEM3eTK+teecLEy8QymZjjDTrCHg4x36
2AczdlQAIiq5TSAucGja5VP8g1zTnfL/RAxEZvLS471GABptArolXY2hMVHdVEYcTduZlu8aHARc
phXveOB5/l3bPqpMVf2aFalv4ab733Aw6cPuQkbtwpMFifp9Y3s/0HGBfADomK4OeDTDJfuvCp8g
a907E48SjOJBGkh6c6B3ace2XH+CyB7+WBsoK6hsrV5twAXSe7frgP4lN/4Cm2isQl3D7vXM3PBQ
ddI2aZzmewTfbgZptt4KCUhZh+t7FGB6ZKppQ++Rx0zsGN1s71MtjJnhXvJyPs9UyL1n7KQPTEX/
07kwIwdMjxC/hpbZmVq0mVccpMy7FYlTuiwFD+TEnhmxGDTVTJ267fcfrySVBHioA7vugeXaX3yL
SqGQdCWnsz5LyCxWvcfI7zjiXJLwefechLp0LWEBIH5+0fJPB1lfiy1DUutGDJTh9WZHeXfVVFsf
rSQ3y0VaTqBESMjYsJnFFYQJ9tZJScBluOYacW6gqPGC6EU+bNYC1wpngwVayaQQMIIGbTCCBFWg
AwIBAgIMGHX6KxYK3WW2YyprMA0GCSqGSIb3DQEBCwUAMFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQK
ExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9iYWxTaWduIEdDQyBSNiBTTUlNRSBDQSAy
MDIzMB4XDTI0MDkyNTEzNTAzMVoXDTI2MDkyNjEzNTAzMVowgbMxCzAJBgNVBAYTAlVTMRMwEQYD
VQQIEwpDYWxpZm9ybmlhMREwDwYDVQQHEwhTYW4gSm9zZTEZMBcGA1UEYRMQTlRSVVMrREUtNjYx
MDExNzEWMBQGA1UEChMNQlJPQURDT00gSU5DLjEaMBgGA1UEAxMRSml0ZW5kcmEgVmVnaXJhanUx
LTArBgkqhkiG9w0BCQEWHmppdGVuZHJhLnZlZ2lyYWp1QGJyb2FkY29tLmNvbTCCASIwDQYJKoZI
hvcNAQEBBQADggEPADCCAQoCggEBAKWV+9PYvG4njqRsbQas79f8Q46VL7b1ZxvWT6ik6VMbdRZx
tfpfZalVXksqcb02/N1H7UA9V04cV2q97FkSr/KxeFLMetPb3cVJZICg23IRO2NTPdmgPFzwkPTo
35h9h/OYLgh3/9a1nTsC2xqJa8GtohD5+42rsskGcI57U4n1r1L4R5IL9ypSqDxX/xVEAdGI5FTj
VgvoZC6iuEbnez+yO8TT3wun9b/PQowOB5P0CwIFv7ERW0S1s6B8yrbsoaTrz0vQaEA786k1pZkg
ykC1+zXq/iTyZuPP4B4RkzFd43Pw+GAH0Tt2nx5V4rNisJHeAVNU92Gj01cEg0I+FnsCAwEAAaOC
Ad8wggHbMA4GA1UdDwEB/wQEAwIFoDCBkwYIKwYBBQUHAQEEgYYwgYMwRgYIKwYBBQUHMAKGOmh0
dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzZ2NjcjZzbWltZWNhMjAyMy5jcnQw
OQYIKwYBBQUHMAGGLWh0dHA6Ly9vY3NwLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWltZWNhMjAy
MzBlBgNVHSAEXjBcMAkGB2eBDAEFAwEwCwYJKwYBBAGgMgEoMEIGCisGAQQBoDIKAwIwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIw
ADBBBgNVHR8EOjA4MDagNKAyhjBodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjZzbWlt
ZWNhMjAyMy5jcmwwKQYDVR0RBCIwIIEeaml0ZW5kcmEudmVnaXJhanVAYnJvYWRjb20uY29tMBMG
A1UdJQQMMAoGCCsGAQUFBwMEMB8GA1UdIwQYMBaAFAApNp5ceroPry1QLdugI4UYsKCSMB0GA1Ud
DgQWBBRq5Jlxz3MqC+zEgUxK566xEc2g3DANBgkqhkiG9w0BAQsFAAOCAgEARXrmeeWA31pp9Tr0
M6mOlMv+Pr2raES4GzPSyftvxf6tBQCBNaqi6LSbyusDYOj3mG9bp6VeVn+68OxNY9iNAk+ujtId
f3+30BlZOQ1v8z9u2peUOUtWI60y2MxhdH0X0n2H+BCGvUOFqs5z440jqqy1HsscZTXHB7FEZmVP
fyD+0Z6cxyh7WNC6+BgLiFwf8iqmAbu7Yb1sGTUGyS5gfYEjJbF2PJfwNUcJDd7eS4w5Ju5mK5y7
spgjH2/JmDgbkpSk9JyuWfjGZIg4ah/q2nb6UMd1XJb6gLQZuzPOI3SgXPvd8MHGjKZrX2BHOBSC
bJJ8rp4w4a9QMS6dde2MFObusxkZAft4tUnwo+ProchHs7iA85sL7sWEZhAmjmKKCpECpEfZm0+/
hpvKQV3AZp5vBstb4IVL8QmLj8beDVHYnNhEicsSiG1wW7zSYyBnmGbFRrFQIJnJDWPjTZOlVEyp
T1ShrXRCtqJpOt6rgg+rFEY3D8j6/bAkJXnmKnE2LZ0YyrrKk7eC6UfNNimx38w3NWchtcGY8zJn
Y/1/C9Jv/mWm/2lK8nvusOFxhKmbG83Hx8toQdZ5F1kYk6zAWjfB7lwXr/En9mCmLieJ18hen9EK
qbYyUkmCmuoLi5GXFMJy+iQv6DgMVQ7CACagybU6FUrmL9lVa+A6caBEEh4xggJXMIICUwIBATBi
MFIxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSgwJgYDVQQDEx9HbG9i
YWxTaWduIEdDQyBSNiBTTUlNRSBDQSAyMDIzAgwYdforFgrdZbZjKmswDQYJYIZIAWUDBAIBBQCg
gccwLwYJKoZIhvcNAQkEMSIEIKxBtT0XlPEv1PRsOCxZHhJYg42Fs8dobavsL5g3SDEOMBgGCSqG
SIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI2MDQxMDIxMDQ0NlowXAYJKoZI
hvcNAQkPMU8wTTALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG
9w0DBzALBgkqhkiG9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBAE6/4WL0elXQ
V4EKLePQamod5sqitKTHfUrfDJmg32JFbE1jNHlI7DyC5yiZfubzVWt5M2w5czyjbNRvV+3DgSWd
y+r4msnW9ICjAk6rrkKGNhm7MU7a+ShduWBoDGQvhCiQm0Ry4WJd2yHGgj825NMJkn/tlGxIpywL
hMa09DW/A6nK1jD/B/dcY8BHEfxrzkRIWxnMBBJlnUogXf/O5//a8Eb9Tz9Kbzjkt/ot0oyj+P0X
CBne1V+v94tm5UwUpogexnyNNaVdjDmZgYXk0sLxxXvCsnKJYAb2BE3+A0P8SFPLS/XLOh8dxgQ2
GKy9JQLPU1WTeHuHRNGFuiXGgTo=
--0000000000009389ea064f217b2c--
