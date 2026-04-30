Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B28D540B6DF
	for <linux-sunxi@lists.linux.dev>; Thu, 30 Apr 2026 12:56:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777553811; cv=none; b=ObxzHDUr8yFCpHZVgCGPIr7k7XzIwTnHiwi4rUWlHX1Ia0lbdIbsMcxZo+xbEgBKS2tJ5zI2SeeIHRRhixH7vfOdTI+gm5cJCYNzVRNflOZHzEdVHiOyA4XW7Q/AzVZgwPbU467WEvUYuvVkzk9d54sTxapOVv692eCVzZq0SFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777553811; c=relaxed/simple;
	bh=EUAeZZiWir+om8O/lfmhWKlIvgnl/Vp0lghxn/70ykI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aDCJ4m6puXqttsL5muaDV7nwoM7f5oLR6Ff/TQqkGRhpRZ+Q7w5oyEcObPACCt0DwgMZn7VNn/Vv8jkr7E+iC21tFF8Tli1PazFh6nFFZ44X2RPxWc10x2L6fnI9Zh1snDLQ3Fuk2E+HZBjXkRbs3slI47Fz9E9oP3WZ7tEdrkU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ba5b107eaa2so144177966b.3
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Apr 2026 05:56:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777553808; x=1778158608;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nuQFrVM35wc/XdWiWZfeFiOqf6xuZFSJEgb1hfqaX5M=;
        b=FwRhgH2EVhc1RbUVwmy60a+boqJxt+0jv8uBVKvJTNkVhW8vLj0aWM5QKD00iqRZZ/
         1/Av2OEqMjBZRD/sNBRU1Y6Nqh/wpFo+Pv6xSNuyS543wRRdgolvM02VqVtQoTUl7oxD
         /tligdw4t4IUu4Kz/TI+DVJLAQVuG878YLyyxzaGeZziaB/AFp/j6AMsZC05mIXhJPk4
         6TByTIEF1Nhi0FjIE6VlT4XQn+wmpnds7b2OXZQhuZ2Lr1e7240l8Ak50lTkPcSCOkZZ
         Q3hMzswXkdf6unXt2SHExz1SCHhlwvb43MsFnjbExmq8yYOdTc0pbTdKZSEQA2/riU+V
         CHDQ==
X-Forwarded-Encrypted: i=1; AFNElJ+WLNV91mftVF75ll+rDLXAxAD8T/m4yaY01jWk+LVzkv6/3oAcit8wf52hUv6l/8KGTUR5M+ffJDzVKg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXmOjQ0w7ZwL/CrUueAc0Rd1t3c8ytRrDjhWvPo/GaTg9O+RK9
	PChWc1vC0rE9+Z7D/3d2yioB6u1j4twVqhAZXftbWwI1SnnmEkB18CavR50VxONDy+M=
X-Gm-Gg: AeBDietMvQ6cVEgLwQwoHdmgurcSlv9FhURiOr+8UlTFAzHNHI4orHGDWPiCgsCkYqC
	u/NPOWvBfeFY7f//ffzrhIf/AIxeft6KE0ha7QBD7R9MuwqFnCn+p9NP0qTPP5HurYGibJANgct
	vkVdXZZ0ROyUxuOUeppdxNz92Ut1HVqj5QqeRMn3PSa2oan+zYqCcfgG3xkXQ7lMvqVZAYBv5wa
	SyWeANUWcXrCCq32hAWCzhBNV5i+VPjuI4rsUy58oKHVJQpSYp1gjTQRR0uNJKVxnYxDjHReYmv
	nR7WO7XYchmizN1M+MEWxsIdJ9OUT6TEvoANNtYsXu4RbUaUFY/glL1LWLxncs0dzWVqDxeU/ua
	R0n2H9MW5l5e8Zh7ymz4S6cTJAlRt9OaUwO2UpONxh8Pw4MVqyxy/ItxYw52591+twtjtEsOPFy
	suPilddG84HZyHIUo73JcmetbAzN/mr6oASoDIJ+TNlYm9IRC7xcpHtvRl+o5zhQ==
X-Received: by 2002:a17:907:3e9a:b0:bae:658a:61af with SMTP id a640c23a62f3a-bbac65abda6mr189547066b.23.1777553807417;
        Thu, 30 Apr 2026 05:56:47 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bb981d482c6sm227985366b.25.2026.04.30.05.56.47
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 05:56:47 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b9c3e2cf3c0so145125366b.1
        for <linux-sunxi@lists.linux.dev>; Thu, 30 Apr 2026 05:56:47 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8BTNIYkRCVyf+UXpy+LHvzP5rPiNyQ50TvJI6D27+l0YKFlV8IBYxv5h7u9EJJfG+FOQSN0P0X+XuMtg==@lists.linux.dev
X-Received: by 2002:a05:6512:10c8:b0:5a4:175a:ce72 with SMTP id
 2adb3069b0e04-5a8522dd822mr1025501e87.39.1777553399625; Thu, 30 Apr 2026
 05:49:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251025043129.160454-1-iuncuim@gmail.com> <20251025043129.160454-2-iuncuim@gmail.com>
 <20251026210905.GA2941518-robh@kernel.org> <1935223.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <1935223.tdWV9SEqCh@jernej-laptop>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 30 Apr 2026 21:49:47 +0900
X-Gmail-Original-Message-ID: <CAGb2v64z9RMsGiy0skudn4cgo=RajxCho-vaXr5rUo5HPpqjPQ@mail.gmail.com>
X-Gm-Features: AVHnY4IT6nLdgfoMRlxWNV7nGADa-98ikdi3BEcPI2XpUYcTyVZLvYz4C1kzI-g
Message-ID: <CAGb2v64z9RMsGiy0skudn4cgo=RajxCho-vaXr5rUo5HPpqjPQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/6] dt-bindings: thermal: sun8i: Add A523 THS0/1 controllers
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: iuncuim <iuncuim@gmail.com>, Rob Herring <robh@kernel.org>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andre Przywara <andre.przywara@arm.com>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 28, 2025 at 3:01=E2=80=AFAM Jernej =C5=A0krabec <jernej.skrabec=
@gmail.com> wrote:
>
> Hi,
>
> Dne nedelja, 26. oktober 2025 ob 22:09:05 Srednjeevropski standardni =C4=
=8Das je Rob Herring napisal(a):
> > On Sat, Oct 25, 2025 at 12:31:24PM +0800, iuncuim wrote:
> > > From: Mikhail Kalashnikov <iuncuim@gmail.com>
> > >
> > > Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
> > > description of the thermal sensors in the A523 processor.
> > > The controllers require activation of the additional frequency of the
> > > associated gpadc controller, so a new clock property has been added.
> > >
> > > The calibration data is split into two cells that are in different ar=
eas
> > > of nvmem. Both controllers require access to both memory cell, so a n=
ew
> > > property nvmem-cells has been added. To maintain backward compatibili=
ty,
> > > the name of the old cell remains the same and the new nvmem-cell-name=
s is
> > > called calibration-second-part
> > >
> > > Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> > > ---
> > >  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 56 +++++++++++++++++=
+-
> > >  1 file changed, 53 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8=
i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i=
-a83t-ths.yaml
> > > index 3e61689f6..b2f750ef2 100644
> > > --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-=
ths.yaml
> > > +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-=
ths.yaml
> > > @@ -24,18 +24,23 @@ properties:
> > >        - allwinner,sun50i-h5-ths
> > >        - allwinner,sun50i-h6-ths
> > >        - allwinner,sun50i-h616-ths
> > > +      - allwinner,sun55i-a523-ths0
> > > +      - allwinner,sun55i-a523-ths1
> > >
> > >    clocks:
> > >      minItems: 1
> > >      items:
> > >        - description: Bus Clock
> > >        - description: Module Clock
> > > +      - description: GPADC Clock
> > >
> > >    clock-names:
> > >      minItems: 1
> > > +    maxItems: 2
> >
> > How can the max be both 2 and...
> >
> > >      items:
> > >        - const: bus
> > >        - const: mod
> > > +      - const: gpadc
> >
> > ...3 entries?
> >
>
> Because old variant uses "bus" and "mod" and new variant uses "bus" and
> "gpadc" and none of them uses all 3 entries.
>
> Although, I guess we can simplify and just use "mod" in both cases.

Yes. Please just keep using "mod".


ChenYu
