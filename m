Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD55C1E87F
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Jun 2024 17:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717693512; cv=none; b=BvHXOvgzw/ec4CBnFdehgExvJrRkbE+iV2FAY6H0zUL1aV+Sw1i6Z2Y1plzMs3wAEUNRhZWvaVDoggIN2guEvUbRO+n+7KOB/cavcK42twu+4qdCdnVhRgn1GIh0ChFp1EbIR/9JtgGZ6Ja1frYY75ZBjJ2DoV+BpFTL1NuBcRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717693512; c=relaxed/simple;
	bh=V2kjYJf3QZ3srA2bWcxwmOaryQ3hg2zEuj8/EzkmJrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4jgug5aNbcZjZBPbEbCihYUYr7G0pwOZV9ocxmcsiVAuO6FoLxLYWNA0FNxpHCDxC/LNCnrnofzPZLMv7xxrjQfYixTZme/CJli6kdwltjTi24CA8yJR6qQ5oNoHFkeNI6uwjSsL/3x2HF/a1GL618GIem/7eEvcQaWVDHWeZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52b9d062526so1385153e87.3
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Jun 2024 10:05:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717693507; x=1718298307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1QkWLvVozh3rOBWMvwLPwR/I9dP5vk9Rq7o/N5NibLo=;
        b=uu1/+3ZbMr8QqAg3jBJA3bIRBkNYY+o6FQ0HeNSj7VBTbY0ETiKEGu/9kHaN7UbdEk
         yZa/Ojlf3swgPftre9/xKapZEgOE6qoq6NKoTbU8ZAay6eqFrjxUpRxDeD1HMMA+r5nQ
         xyxdAAc54jInTC6uhpkcfWDjtOYimFGB57UWePdyQbYA0X65XarnKI4oEUDCjTVevXgI
         6VctE9Z6u+08q4iVZ/LaFRarLkn4it5pYOp1/41IVfKeW5UT9V7BZigShm2G17G9UCdB
         iufY+xGchkpAsfrxofPhyLFWO+ybcKWxGIvoC7cTtVXgoOVWHDXJFaCUNOafBFDajh8I
         sqaw==
X-Forwarded-Encrypted: i=1; AJvYcCWVHZ2Zndt3ixo6JiG5DD1Ec0NEj/mO7i2csQ+mSEqLWU0DPaPJfJv1Ncu02HGcorXkmzRCMpe92jDe9yvYNolP0LwkiHdTTlrvdDQ=
X-Gm-Message-State: AOJu0YzK3ZlwM4nZndJ2M9hF92/RKRFa8KQHbY528Jzuyqzzxr/Oznoc
	/Afa1Ir12MWVDm0oCSkTD1zsDespjsZv3BylY+zcGS5IHSMVRomFlvSbYLJ7
X-Google-Smtp-Source: AGHT+IEPrLb+fb1R+E2yQ4xe7mtmB8TrgjwqXV6Z/2Yy3OJugH+UQshCL/N3JT3hnd8vzHKGxX7DGQ==
X-Received: by 2002:a19:ca57:0:b0:51e:fa9d:a532 with SMTP id 2adb3069b0e04-52bb9f8e9b1mr162185e87.37.1717693507041;
        Thu, 06 Jun 2024 10:05:07 -0700 (PDT)
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com. [209.85.208.173])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb423e3acsm244344e87.225.2024.06.06.10.05.06
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jun 2024 10:05:06 -0700 (PDT)
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2ead2c6b50bso10568261fa.0
        for <linux-sunxi@lists.linux.dev>; Thu, 06 Jun 2024 10:05:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3HGLrDVaKqSj3kHd+U2FtXmdwAk0hhP11VmyEq8xWx4cLDSpCh/M/+/OrfeKwYo2VEkLO2U57y5kvuYrYw55E2xvL1zgrY0Wtb4M=
X-Received: by 2002:a2e:82c8:0:b0:2e9:8418:1f5f with SMTP id
 38308e7fff4ca-2eadce16d64mr2174231fa.6.1717693506672; Thu, 06 Jun 2024
 10:05:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240605185339.266833-1-macroalpha82@gmail.com>
 <20240605185339.266833-2-macroalpha82@gmail.com> <20240606112614.5380b2d1@donnerap.manchester.arm.com>
 <20240606-ludicrous-unyielding-gerbil-e23f41@houat> <DM4PR05MB9229B137C69F3B2D2A9F7B64A5FA2@DM4PR05MB9229.namprd05.prod.outlook.com>
In-Reply-To: <DM4PR05MB9229B137C69F3B2D2A9F7B64A5FA2@DM4PR05MB9229.namprd05.prod.outlook.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Fri, 7 Jun 2024 01:04:52 +0800
X-Gmail-Original-Message-ID: <CAGb2v66kuiCCw9qk--f1y7ABBxirRFiRf=D6HXy4AE06jHLLQA@mail.gmail.com>
Message-ID: <CAGb2v66kuiCCw9qk--f1y7ABBxirRFiRf=D6HXy4AE06jHLLQA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm: sunxi: Add Anbernic RG35XXSP
To: Chris Morgan <macromorgan@hotmail.com>
Cc: Maxime Ripard <mripard@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Chris Morgan <macroalpha82@gmail.com>, linux-sunxi@lists.linux.dev, 
	devicetree@vger.kernel.org, ryan@testtoast.com, samuel@sholland.org, 
	jernej.skrabec@gmail.com, conor+dt@kernel.org, krzk+dt@kernel.org, 
	robh@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 7, 2024 at 12:55=E2=80=AFAM Chris Morgan <macromorgan@hotmail.c=
om> wrote:
>
> On Thu, Jun 06, 2024 at 01:30:45PM +0200, Maxime Ripard wrote:
> > Hi,
> >
> > On Thu, Jun 06, 2024 at 11:26:14AM GMT, Andre Przywara wrote:
> > > On Wed,  5 Jun 2024 13:53:38 -0500
> > > Chris Morgan <macroalpha82@gmail.com> wrote:
> > > > From: Chris Morgan <macromorgan@hotmail.com>
> > > >
> > > > Add the Anbernic RG35XXSP variant device and consolidate the Anbern=
ic
> > > > H700 devices.
> > > >
> > > > The Anbernic RG35XXSP is almost identical to the RG35XX-Plus, but i=
n a
> > > > clamshell form-factor.
> > > >
> > > > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > > > ---
> > > >  .../devicetree/bindings/arm/sunxi.yaml        | 24 +++++++--------=
----
> > > >  1 file changed, 9 insertions(+), 15 deletions(-)
> > > >
> > > > diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Doc=
umentation/devicetree/bindings/arm/sunxi.yaml
> > > > index c2a158b75e49..1ae77e5edf9a 100644
> > > > --- a/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > > +++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
> > > > @@ -51,25 +51,19 @@ properties:
> > > >            - const: allwinner,parrot
> > > >            - const: allwinner,sun8i-a33
> > > >
> > > > -      - description: Anbernic RG-Nano
> > > > -        items:
> > > > -          - const: anbernic,rg-nano
> > > > -          - const: allwinner,sun8i-v3s
> > > > -
> > > > -      - description: Anbernic RG35XX (2024)
> > > > -        items:
> > > > -          - const: anbernic,rg35xx-2024
> > > > -          - const: allwinner,sun50i-h700
> > > > -
> > > > -      - description: Anbernic RG35XX Plus
> > > > +      - description: Anbernic H700 Handheld Gaming Console
> > >
> > > So that's certainly an interesting optimisation, but so far we were u=
sing
> > > one entry per device, it seems.
> > > I am not entirely sure what the purpose of this file is, exactly: jus=
t to
> > > document the compatible names
> >
> > That was the initial intent, yes.
> >
> > > to reserve them and avoid clashes in the future?
> >
> > And I guess it helps with that too :)
> >
> > > Or also to put some official names to each device? That seems to
> > > somewhat overlap with the root node's model property in the respectiv=
e
> > > device .dts, though.
> >
> > I guess it's a fair criticism. It would be hard to collect all the
> > compatibles without describing which device they belong too though. So
> > yeah, there's some redundancy, but removing the descriptions entirely
> > would be worse imo.
> >
> > > It would be good to clarify this, and establish how to group those de=
vices.
> > > I mean technically we could for instance put *all* H6 devices into on=
e
> > > entry, using the same scheme as below.
> > > Not sure that's desired, though.
> >
> > I don't really have a say there anymore, but I always tend to prefer
> > consistency in documentation as a user. Even more so since that kind of
> > categorization tends to be very subjective and thus super inconsistent.
> >
> > Maxime
>
> This is how I was asked to do it in the rockchip.yaml file [1], but I
> know different teams have different style requests. Just let me know
> what you prefer and I'll get it done that way.

For now, please just keep each board entry separate to keep the same
style as the rest of the file.

ChenYu

> [1] https://lore.kernel.org/all/20240123212111.202146-3-macroalpha82@gmai=
l.com/
>
> Thank you,
> Chris.
