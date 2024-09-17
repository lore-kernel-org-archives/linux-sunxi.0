Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9479E38FA1
	for <linux-sunxi@lists.linux.dev>; Tue, 17 Sep 2024 17:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726595791; cv=none; b=BqnGZmiLR4QL3zQeNcU7scGneNqfbQJl5nXucsPzB788FezSwNCulEh+42rXLNPoFKAmWGHhYdWzImWwhxogr6VERk96X9KP8Myy9kqhLl+twWCIS/56NyY55nx7WVsTnOKC7avIM7wB01lBtzAcJPi3di5PR6rK3s2EdcrAm5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726595791; c=relaxed/simple;
	bh=jNOYaOj4cZ7Bpj+k1zqagr701zaY26OWbDuiBz+4H2E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKpfP/LwWef4AjFjKr9gzZp6FZRk8+Efrl9GpKXJcqHpyRmock9SPZG1Imydqz0paYSqIijyH9L3odQWbivkQv/8eT/GRXn+wJTrJBbvfwd+ydlSlfSQh84/fs/CnpXFarRdUw6HsxDdH7cKwWEqYyl5luHudtxczNz/1OBvwKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iIJWsDLb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iIJWsDLb"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53653682246so7024556e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 17 Sep 2024 10:56:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726595788; x=1727200588; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s+KgzJbKXX2uFfdVaHE0+abgKaVfXlOq3EDefktc24M=;
        b=iIJWsDLbzjjqCXmzlAEn4lmuPcAwwUrOsej35sNwC3EDxBofj8MQLqUedHQsWPbYhM
         FrujLJL6KcUHRlB+fpuHUnvW6EIFGbF0l3wHAvnKxjbrfMdMttRa5RNQJGS5TLvBhgB5
         ZGOiK/IcrmMQrQa7jzUbrBGjZvQHAI1RLncBTVgfg0eIr1tyMSFOurHIv1GkvzXMJdTz
         GiWKz6t2eovUKOUzwy4arVjdL9BVM3L7yrbofEepBo0O/Lzws/qRxAhr74j8rmCFUx0I
         j2KW5YomJZthqe+vYw20byjrT3zrU7rVlRka1ksB3HS3TojA9rhiWq9KY9W3s7KLNPbI
         Lo5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726595788; x=1727200588;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:message-id:subject:cc:to
         :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+KgzJbKXX2uFfdVaHE0+abgKaVfXlOq3EDefktc24M=;
        b=vD2aHIcW3amA349lwk22+824WgsLlW8AkOOaQUQ6swn7z49Nh65CGe6mHOGVdCErG5
         ZJEoh+9RT1hq/VFvRG5qkI+TrxZbVul0bm6rXMKrxg/V84ipoX2fb1HmeZBTny5TGYcp
         +Y/ZbkU+Spv8s8F2Nr/V4ZjISMN+0YCGIGhmFOK8m/bgw/t7Gf77ANaoOex7uM3PYnYv
         8SFJK63v6AJmLFjglJ6HFQ6t/y2ETBDeDh8BiaT6bJPLVlRmaSoYjk1lDS+2u24coE7E
         ImNB7Dau5lGjfE95auHWqYMpIDnNf+lPSBbs4pi6usnRkO06MnEu1//s5LHm6blT0wUa
         d9Nw==
X-Forwarded-Encrypted: i=1; AJvYcCUHT0Av4Y62SeiFYRAkWv+cppLirip6seLlKpBAr7n9zzKQdevS/PrBpFfhjlz6dRGRUFLECBAE67LvMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwJNqEb/X/qgFffWqnqNhjR/jn7Ag4IRqI9kszZKPtW05Iw4MbO
	m+IDnepd3V//gJmICnQabBCn8etqt50l49OssKy747vt0UGipwk5
X-Google-Smtp-Source: AGHT+IGKoOrv9ibAXTusAtqFkTwRnyIi4B3hpxcTBt6/NiSrEeCOLDrGayN8MUF72ybhjTsTH/omDA==
X-Received: by 2002:a05:6512:a91:b0:52e:74d5:89ae with SMTP id 2adb3069b0e04-53678feb07bmr11133534e87.39.1726595787251;
        Tue, 17 Sep 2024 10:56:27 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-536870a86c7sm1279253e87.223.2024.09.17.10.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 10:56:26 -0700 (PDT)
Date: Tue, 17 Sep 2024 20:56:26 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Subject: Re: [PATCH] arm64: dts: sun50i-a64-pinephone: Add mount matrix for
 accelerometer
Message-ID: <ZunCysUTSfQU1ylg@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
References: <20240916204521.2033218-1-andrej.skvortzov@gmail.com>
 <6e5d0e9978bff30559c17f30d1495b59@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e5d0e9978bff30559c17f30d1495b59@manjaro.org>

Hi, Dragan,

On 24-09-16 23:08, Dragan Simic wrote:
> Hello Andrey,
> 
> On 2024-09-16 22:45, Andrey Skvortsov wrote:
> > From: Ondřej Jirman <megi@xff.cz>
> > 
> > accelerometer is mounted the way x and z-axis are invereted, x and y
> > axis have to be spawed to match device orientation.
> > The mount matrix is based on PCB drawing and was tested on the device.
> 
> This commit summary should be copyedited for grammar and style.  If
> you want, I can provide a copyedited version?

It would be helpful to avoid further grammar/style problems in the
commit message. Thanks in advance.

> 
> > Signed-off-by: Ondrej Jirman <megi@xff.cz>
> > Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> > ---
> >  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > index bc6af17e9267a..1da7506c38cd0 100644
> > --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> > @@ -229,6 +229,9 @@ accelerometer@68 {
> >  		interrupts = <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
> >  		vdd-supply = <&reg_dldo1>;
> >  		vddio-supply = <&reg_dldo1>;
> > +		mount-matrix = "0", "1", "0",
> > +				"-1", "0", "0",
> > +				"0", "0", "-1";
> >  	};
> >  };

-- 
Best regards,
Andrey Skvortsov
