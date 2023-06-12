Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAF320F1
	for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 18:34:10 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-977d55ac17bso845408266b.3
        for <linux-sunxi@lists.linux.dev>; Mon, 12 Jun 2023 11:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686594849; x=1689186849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjxKYpDykfJHHAFMlYnHgt/KtNfNEauymoXHInEP4vM=;
        b=fdYVg3CrHfYmOH+yQnThlmPuy5K7Ec9e+rHetrmfAE8U3jCTdYy30Lz22r6JK/dUWO
         fGXiUbALgxdGn2lw2KSzhZYVZ1cEYH6M8+p8bbAR5d7mr/T2LqrOGv2cmf/Rt8SPBagW
         zIVLfGcnCEGk0C/e6R76r6ovMDsRaFgQmgmwLTtA1i3UzQHEfQHkqdSwYK6fLpm4xFgE
         mjrdut3xCamDSyzfp1xFRAs+hmGZ5wKc+D5rE7joQF4E8WiovvkeVt8Wq0Ce7QoKtd00
         f50SP5YRSF2zVFRDJ/jPYFMRfoITlONYXDYUSNMbdOm8fFNXBrZBWelj/LNME/yZlee8
         3uBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686594849; x=1689186849;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HjxKYpDykfJHHAFMlYnHgt/KtNfNEauymoXHInEP4vM=;
        b=Xn5GwQ31Ui3qOaZ0BILQAcAC5A3vjSE/Z8yj5xRuwpTwXJ72UMKIjFhKdTipKv7ux7
         RtSzbZGZwhOWvg65MeGszEmzPM0X//EPYiwV3rqYXrWoiB9z+Ub3E+j/rPy1xSh4cIVy
         UPksu8sxCy9w4t35GTQhL2znAo/8V+1tR916aGQg9n92457FOpQWaoDV6XWy34nA6SY+
         fQ6CEAPhsmfM6Uz45fAuKQKkuRTrNa6bmyX9RgboNr+hz2upbrU+xiEE/tn/344b7kfH
         Qwa7oEj3T3HHW5ZMwDCkGbrY9KtuBVnrsY9la3ZxQBZxa8uI96x8ANi5wRkBBfaY28ZU
         4ROA==
X-Gm-Message-State: AC+VfDzEW93hrdDNIc3pz0qDycxBMHGYF6f3LUdXXxOhYlh9mMuXFyLo
	uxku58Z2NIC19yAQnVQIZeWQms05cjdAHDlRXUA=
X-Google-Smtp-Source: ACHHUZ6HVJPNDxoxp2Cvdq8Nf48yX+kPMvxENdK/HbCk4P4iVuj89/INjrfgS3cZ3HvNthb6VJXM7cJI0toaf9QtkR0=
X-Received: by 2002:a17:907:320a:b0:975:942e:81d5 with SMTP id
 xg10-20020a170907320a00b00975942e81d5mr10759652ejb.1.1686594848974; Mon, 12
 Jun 2023 11:34:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230610203549.1127334-1-bigunclemax@gmail.com> <13282074.uLZWGnKmhe@jernej-laptop>
In-Reply-To: <13282074.uLZWGnKmhe@jernej-laptop>
From: Maxim Kiselev <bigunclemax@gmail.com>
Date: Mon, 12 Jun 2023 21:33:57 +0300
Message-ID: <CALHCpMi9h_KGJKJ4qH44kypePsMpqjgDke-A1LiBgiSOnXjXLA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] Add D1/T113s thermal sensor controller support
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: linux-kernel@vger.kernel.org, Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Amit Kucheria <amitk@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, 
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Andre Przywara <andre.przywara@arm.com>, 
	linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 12 =D0=B8=D1=8E=D0=BD. 2023=E2=80=AF=D0=B3. =D0=B2 21:22, Jer=
nej =C5=A0krabec <jernej.skrabec@gmail.com>:
>
> Dne sobota, 10. junij 2023 ob 22:35:41 CEST je Maksim Kiselev napisal(a):
> > This series adds support for Allwinner D1/T113s thermal sensor controll=
er.
> > THIS controller is similar to the one on H6, but with only one sensor a=
nd
> > uses a different scale and offset values.
> >
> > v2:
> > - Fixed SoB tag
>
> It doesn't seems you fixed that.

Sorry for that. I accidentally sent the wrong version of patches . And
immediately after that I sent v3.
