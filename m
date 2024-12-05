Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B96CBE4A
	for <linux-sunxi@lists.linux.dev>; Thu,  5 Dec 2024 04:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733372179; cv=none; b=SM+SG5euQEL+DaMYh39XxudYNVjbCnet238qtGINnLwhfJtZ4uXS2RAP14biv9FCfnLmvoaWE3Uv11JmQz3dTMbYT2et7OM054LtZsTROIH4fHJjtxzrGAFipJ9YYCJENRNSRgsMFhiV/e2IYiPLmLmX2ohMFeQEdeepsjbxkCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733372179; c=relaxed/simple;
	bh=KSxHh4MX6DMW5Fj4irqntnsdy4M8bKuHYO0r/f9HTP8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pk5Z6J5VfG4WnLbbU/HSMapHM3MgQZRmAB2VyYzvWYp+a1mt/tuJ8obxQQXE/tbJNOkbJYizCCOxuuyr5ERWdUZg222PqOY9I48VGbXdsLo4ux3xxBYTrf5WX2XissMB0+X8bbUovaT+YryO+mgfmtEwLC3OP75X7d0QZSgOOyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-53df119675dso647168e87.0
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Dec 2024 20:16:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733372175; x=1733976975;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piW9kHZgsyQb9cy9HU5rDPdSyIGIWO93TJJ1y0kDyvc=;
        b=O5W9rPmYzv3Hq0VAPeMJXUrrRG181ysG/lXDkf1XgktNVQo0aBRoaXchuE+3LtTww7
         2h34fhYfzQkvDakcyLjVX88yFRdRKVxSvYCoF91DZSUR4B/Cv9UqUeETuUUN8o82oDaJ
         B0ycAAYlVeReReTIiVIUFFZH9oqNOpP6Dskh2u3kpoIAZrWbvrnN9S22P9IU5x7rvLMT
         Sd6+Y0e4aiu3Jv+89oCLcs0AvsANKWEwlrXS1kR3RWuVms1G9NiMWi1D9iuOG9Wg5m7z
         Fc5A2lZCZQOOlH1tlf1OM08fZawgt4oR84yQbQPqR2eB40CJxnBkf0sbtFnkzCX1RYZk
         kxGA==
X-Forwarded-Encrypted: i=1; AJvYcCXuxnGQI47cZCcMYCOpZIWkVAIFJ9ukggLS/FpkfOr7cibirRtZnef0aSz5uDMkbyAW1z4d+RD6K7Wdcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyQ78vN0YDQHLi/XE+KPRFnAKEeJQeAnYZOLW6tQ9jWFFIcsIZL
	tyyHcrC2nr+Qh3GTRAhWPNLTEDZ8FOKsJheTrN2xBVvinlWQA0X6SuHE7Do8
X-Gm-Gg: ASbGnctXcxmvcvtBFZKJg8Lpoolaw4+Q9VcflVX2T94jLL04BwG7bMJIZ8fgBfbS+Zp
	CzWJ/WvBTq1gJ0QWt4Fq9Bc8ahNZ7vI7ZZyPvmC7RQjKdXdbVKuiX705Gh/69bZ0aVIElywO2k0
	2CE4CbcT69UGd2nZYfK9P2lGSpaWxscur9jbEMoQURgz7j+ed4dtsDr2jSt3YDc8LxST8srOqdG
	okxWSaACKkGusRqEocy2fbYiXySA+oEHsy04QyeaQVzSzr44F3Biy8QAwtVOF8nEYHw/8Gu2WYs
	iWeQQYQ=
X-Google-Smtp-Source: AGHT+IG5iyjU86V6BbU4EKrPm60DHPe3yRXOb5nbna00ZJ7Ayo9h8OTcpMRFcEVBAR8qRYDfZuwi6A==
X-Received: by 2002:a2e:bcc8:0:b0:300:25f6:9b43 with SMTP id 38308e7fff4ca-30025f69ccdmr200761fa.20.1733372174514;
        Wed, 04 Dec 2024 20:16:14 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30020e56f44sm883321fa.104.2024.12.04.20.16.14
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 20:16:14 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2ffc86948dcso4036351fa.2
        for <linux-sunxi@lists.linux.dev>; Wed, 04 Dec 2024 20:16:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUmpS1Gs8nbJfYSSd2cpACorVUZAMUp0xYezPX7Nu240CtqQEcqAo2iAwhwcZ2WTRLJDI5dQQzG31FwWA==@lists.linux.dev
X-Received: by 2002:a05:651c:1501:b0:300:1889:6340 with SMTP id
 38308e7fff4ca-30018896590mr21262461fa.13.1733372174094; Wed, 04 Dec 2024
 20:16:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241203203824.23306-1-simons.philippe@gmail.com>
In-Reply-To: <20241203203824.23306-1-simons.philippe@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Thu, 5 Dec 2024 12:16:00 +0800
X-Gmail-Original-Message-ID: <CAGb2v67Uv3SVQSqox85qt_05aVvX0oCynNRoaN9BA1Nha3eo8w@mail.gmail.com>
Message-ID: <CAGb2v67Uv3SVQSqox85qt_05aVvX0oCynNRoaN9BA1Nha3eo8w@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: allwinner: h616: rg35xx add missing regulator-ramp-delay
To: Philippe Simons <simons.philippe@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/Allwinner sunXi SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"open list:ARM/Allwinner sunXi SoC support" <linux-sunxi@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>, 
	Mark Brown <broonie@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 4, 2024 at 4:38=E2=80=AFAM Philippe Simons
<simons.philippe@gmail.com> wrote:
>
> AXP datasheet says that ramp delay is 15.625 us/step,
> which is 10mV in our case.

(CC-ing Mark for knowledge on regulators)

If this is the property of the PMIC, it probably belongs in the driver,
in "regulator_desc.ramp_delay".

The "regulator-ramp-delay" in the DT can be used to override this
if the board has excessive ramp delay due to other design reasons.


ChenYu

> add missing regulator-ramp-delay to dcdc regulators accordingly
>
> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
> ---
>  .../boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts    | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-20=
24.dts b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> index 80ccab7b5..b6e76a804 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-h700-anbernic-rg35xx-2024.dts
> @@ -238,6 +238,7 @@ reg_dcdc1: dcdc1 {
>                                 regulator-always-on;
>                                 regulator-min-microvolt =3D <900000>;
>                                 regulator-max-microvolt =3D <1160000>;
> +                               regulator-ramp-delay =3D <640>;
>                                 regulator-name =3D "vdd-cpu";
>                         };
>
> @@ -245,6 +246,7 @@ reg_dcdc2: dcdc2 {
>                                 regulator-always-on;
>                                 regulator-min-microvolt =3D <940000>;
>                                 regulator-max-microvolt =3D <940000>;
> +                               regulator-ramp-delay =3D <640>;
>                                 regulator-name =3D "vdd-gpu-sys";
>                         };
>
> @@ -252,6 +254,7 @@ reg_dcdc3: dcdc3 {
>                                 regulator-always-on;
>                                 regulator-min-microvolt =3D <1100000>;
>                                 regulator-max-microvolt =3D <1100000>;
> +                               regulator-ramp-delay =3D <640>;
>                                 regulator-name =3D "vdd-dram";
>                         };
>
> --
> 2.47.1
>
