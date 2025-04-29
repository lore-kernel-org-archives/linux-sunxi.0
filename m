Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A63C51A2658
	for <linux-sunxi@lists.linux.dev>; Tue, 29 Apr 2025 15:24:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745940264; cv=none; b=I5Z4L/poHN7yRnNMnNeFJe52f8cHkoK7HYSC68C7KwuY4DdbDERcAQBzPzSIpu1FhsWgzDN4an4zyq2xja6Vww+zJ9zw53A5f996Q6MZuzw7CYGfNcKP6/16rvqcWc5cORLFoT9E1FudLeJdV5hk6a+49RHPxqmFv8dpHusG8h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745940264; c=relaxed/simple;
	bh=xWFmWep8wq/2ahvRVQ4Q4kgybhqxGP9s17w9fhm930Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mb2wy/C8q6bYIW7nFlZ6ZEaBTPM8yPMLlN8AG8VGvLqWOkVBfPhsyGLr6qaVCpfHh2HGoQ4GuE/zC2mno0HmonZqfOL7BfSV81YaSXndmH+NJRlRUk3vG//Aibyi59gA4vda1ZeazXviShE2ATDdOCaK09Lk55YpKS3bUw7ewFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ABXW07zO; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ABXW07zO"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5e5e0caa151so436135a12.0
        for <linux-sunxi@lists.linux.dev>; Tue, 29 Apr 2025 08:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745940261; x=1746545061; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=msGhu6fOF2oyCTN/tI7gZ7eRssIApKs0mAIDv15tSXY=;
        b=ABXW07zOl/M4Q7LouvYRxm/buopgtiFqFkoXxpHciLlIlWWOgbP4p3Gyizeeo8jzkM
         R3lPEeB+U599AWSPY/A8i5vNRy3MEU4xYZ3EsVVIZYtbyLzZTayDfMNYBxJyf6AwUvcX
         Fg2b39f6gjhM6daetpuo7XtG+7KiavmhYtj2CF7/1GwrC4eAttduBj1L8L4bpUzHYqGQ
         KpAatN6MT0kpcDxF6wNcVqdxMMILBTMcwt4KLdTuQue2zJDEkfGM3A4QPiPjwtGGfQSx
         JcMCvReYhIWrIthoCT3jEyg53I56d1UdlTbecVWrE8I2ZcbroOcaEKIUpX97SZpa47qn
         mKKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745940261; x=1746545061;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=msGhu6fOF2oyCTN/tI7gZ7eRssIApKs0mAIDv15tSXY=;
        b=HrisdvN4X9Hi4iZaFCNpWxObdavfHOijWvkZxDEjOFvabtmE7OAdfJIHYwL2WkL8Yh
         uRxkm+clsCXljvRb5Hmm1u9dRFa/iL4w/iwXjYydR+5dAlA/g5DTsqWiqafeMkuPSRy+
         7EfT0mbQ8zh3c50um2YB7kTahaX60gQvhwzBvM61ImJljrDUHtKgJtHf2Yq2Q8M6oyMT
         4OisjGbG7jXeDU2tJM2+FKtmEWugDpgsaHcpXnZdK6JlKVcIwUml4Qzx2S2VkGC+k2Bw
         re/eoPm2iKXH2hQT1tTs7H2V2H2y8wbFT2orRPQ4DjFa8KyXUuw2z/uYR4GBVkbP8hjy
         6O8g==
X-Forwarded-Encrypted: i=1; AJvYcCWJop2jq7EqN/7WPL9yQK6Q1sKG4oHhecSJVPxH92DpDFewnOBkAyktWsjYU8yoYLRxTLlTGxl3ohmtog==@lists.linux.dev
X-Gm-Message-State: AOJu0YxCgD/uS5z7O3aP9810ssoMOzRc7RKN7fVdujhCUoBU09wYMwKC
	DEI0ouI3SheKCIFybfc27LOuzxoQat6d98zypxJe6n0Xbll/k+oP
X-Gm-Gg: ASbGncuzoy5SpTex1ePlG7MEejcRD7KSQqONBSS7pE42ahoNr+M6anM55wmccn+Y5ra
	tmvYf3j/mq6aWC8qzFf89BbUwHOvYUujpaLaUo6knAaLT+iNNmdvQr5qI2ewTc4TS0CRK3JQLQZ
	no27IalwaDhaTB7xqNBXRtQymzcpAMDSFGZqX/tm1FDP5LtjPPTQqVWWPtg0V0SYZdrMwO2po3/
	28x2I+ni11p79x5EiLHQKFK9HHrqboZFyclbZeFMArWCEE2chB0NZrjJ3mZ1R6WmvkAEyP2Kvru
	ptkkpFZC/blpDRSp0jdrsmmVvTSoFWi267JzjKKVZOqVKilPmXvArOyxpFfUwQ4SMG9oQzY5CQ/
	jZv29N/V8IfvA7FgP
X-Google-Smtp-Source: AGHT+IGoCpwI1mhzwqjMaKdTGw9O8H9V2Z9zrCizgtb+8WQLicqiFAzaOh+hZID1l+Pa03HZ4jDIZw==
X-Received: by 2002:a05:6402:3495:b0:5ec:cc90:b126 with SMTP id 4fb4d7f45d1cf-5f838862cd4mr3823949a12.19.1745940260576;
        Tue, 29 Apr 2025 08:24:20 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc469sm7545748a12.7.2025.04.29.08.24.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 08:24:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Andre Przywara <andre.przywara@arm.com>, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@csie.org, samuel@sholland.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h6: Add OrangePi 3 LTS DTS
Date: Tue, 29 Apr 2025 17:24:18 +0200
Message-ID: <4645060.LvFx2qVVIh@jernej-laptop>
In-Reply-To: <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
References:
 <20250413134318.66681-1-jernej.skrabec@gmail.com>
 <5880182.DvuYhMxLoT@jernej-laptop>
 <6a056bf8-9f39-4204-9378-8cc39be60038@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 29. april 2025 ob 17:09:22 Srednjeevropski poletni =C4=8Das je A=
ndrew Lunn napisal(a):
> On Tue, Apr 29, 2025 at 04:51:59PM +0200, Jernej =C5=A0krabec wrote:
> > Dne ponedeljek, 28. april 2025 ob 14:37:48 Srednjeevropski poletni =C4=
=8Das je Andrew Lunn napisal(a):
> > > On Sat, Apr 26, 2025 at 08:00:49PM +0200, Jernej =C5=A0krabec wrote:
> > > > Dne petek, 25. april 2025 ob 17:34:14 Srednjeevropski poletni =C4=
=8Das je Andrew Lunn napisal(a):
> > > > > > > +&emac {
> > > > > > > +	pinctrl-names =3D "default";
> > > > > > > +	pinctrl-0 =3D <&ext_rgmii_pins>;
> > > > > > > +	phy-mode =3D "rgmii-rxid";
> > > > > >=20
> > > > > > So relating to what Andrew said earlier today, should this read=
 rgmii-id
> > > > > > instead? Since the strap resistors just set some boot-up value,=
 but we
> > > > > > want the PHY driver to enable both RX and TX delay programmatic=
ally?
> > > > >=20
> > > > > Yes.
> > > > >=20
> > > > > There is a checkpatch.pl patch working its way through the system
> > > > > which will add warning about any rgmii value other than rgmii-id.=
 Such
> > > > > values need a comment that the PCB has extra long clock
> > > > > lines. Hopefully that will make people actually stop and think ab=
out
> > > > > this, rather than just copy broken vendor code.
> > > >=20
> > > > I spent quite some time working on ethernet support for this board.=
 Once
> > > > I've found PHY datasheet, I confirmed that there is added delay. So=
 this
> > > > particular board needs "rgmii-rxid" mode.
> > >=20
> > > There have been numerous discussions about what these rgmii modes
> > > mean, because DT developers frequently get them wrong.
> > >=20
> > > Does the PCB have an extra long clock line in the TX direction? That
> > > is what rgmii-rxid means, the PCB is providing the TX delay, the
> > > MAC/PHY pair needs to add the RX delay.
> >=20
> > While schematic is accessible, AFAIK PCB/gerbers are not, so I can't re=
ally
> > tell how long it is. But without this extra delay, ethernet doesn't wor=
k.
>=20
> You are not adding an extra delay, you are subtracting a
> delay. 'rgmii-rxid' says the TX delay is implemented by the PCB, hence
> the PHY does not need to add the delay.
>=20
> What is normal is that the PCB adds no delays, and the PHY adds the
> delay for both the RX and the TX. And you represent this with
> 'rgmii-id'.

ok, thanks for explanation.

>=20
> So what you need to find out is, where does the TX delay come from?

How to do that? Strapping show me this way and testing confirmed it. Not
sure what more I can do? As a hobbyist, I don't have access to anything more
than schematic.

Best regards,
Jernej


