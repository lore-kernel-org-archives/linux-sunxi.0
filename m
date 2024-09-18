Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2677135417
	for <linux-sunxi@lists.linux.dev>; Wed, 18 Sep 2024 15:58:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726675124; cv=none; b=cLDOKqGZBP5UREXdcgSTqoaP2UjgBbPO3tziCReA2Tp+DzWDUuH+VYsRCwSUlGigw1eSOtp42J6+YMZf1DEl+iI/ai2pwbrMcSIH+a9b/z0P8AC5V+FmtipuXf2gX9PhwBHuIRVPBs0aulk1NXLYWzU1ZbKa8ZbFGrUd8S5otHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726675124; c=relaxed/simple;
	bh=XTl0akMhLk29+AOFsdWdqvtoDJjo2Zyt/IJFizXRBlY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VHVVOl0jH5URTW4RuqSw7uFZCOdu14OxV3rjJcacQiCOwv3vk4m7Li99f1uT2XWGkbO5c5I91sYVuCq5tCV1YGjfjfsmqdTMprMAEzfNSlMkhetMZcBnTk9hfEtu4G6jDZNM4GRwRNE09xPBBllyRrvJvnoHkj330UixSk3pZuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Dun4oocf; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Dun4oocf"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53653ee23adso6322687e87.3
        for <linux-sunxi@lists.linux.dev>; Wed, 18 Sep 2024 08:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726675120; x=1727279920; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/nN4RLUg+rsp0zC2dF8c0G2tRr1/u478Y/JOVZAT/Z0=;
        b=Dun4oocfDJcEKIzcMPIhtUCUYMnViEvJ+kQK486TeYBsQdtqbfCMi2Yfm9NBUauF+b
         WNsKfoj+E9EtlJpLLpuBLWaI20DVCoZCNntKSTuJo8jYGSqzfEKGBcLDaP51etWlHck8
         nlj90sm72AVFBiaMVp8FTi9JK/RYO54o/soDecy3rOs3QxaLdT0DjD2/EG+mnFCd9ej3
         NbEqtCMOwqK2FfPbHa9IWmOJiQfMOIL6aH8Pmtsg1aQWi7vvalJ7azoqTO6rdOeSufQQ
         z6JKJmycFBnuCfXBT28mkxg6+CYmGht93x4HgQ3a5MDtCBxl+7gv/ES4/qCg0970avwF
         9ziA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726675120; x=1727279920;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/nN4RLUg+rsp0zC2dF8c0G2tRr1/u478Y/JOVZAT/Z0=;
        b=hQW76GSFp7c+Vt005vcTz82LqWmeZSbxlVCaj1KKp3v+26X/PP8wb+mj+PL+600eyb
         3rmdc5Pc7tINs1VUuoJx2//r/pqK3oCqwAkhI9jQkcHZzrMQvLnTR5F1c5ey/a2ncXJK
         m46FAVVsTrmcjku9IGJrDv+ZmcHPOBi1LwH3CGF6V7zIH9XGf8Y/ITijx0+jjKd5pKib
         pQqh3QUooFFAfewAcesq63WlUuwgiI6Z90gd1Clo+BoBFDugLoxbsV9KO5cVx31mGYvO
         jDr86IzgDRCKh5bcnn1H9vPPY/Ecn0ItYzW6eAO6scupftNJ7a6nbyAavoMIxoISuaYb
         zd1A==
X-Forwarded-Encrypted: i=1; AJvYcCWSKeKi0KBldTrbZv3Ft0IrBOUnp3AB/FXZgdBYTj5VAnPnyGYBSh9Vc3EcG3MC/5hNDz24HfUetkZ+DQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGQJsAsSXAX746TCFCS5RityMXA38JVJPaUo9mG06+U5wDLbYA
	Qeam+7Sip++RzAhQJhU6oB/RINwwmqdiaxJoDu6K3T/MEk3Ft2BU
X-Google-Smtp-Source: AGHT+IH8VOQsJfHDSqWN86iefH7nUBxWL2kMFITGTcXQybMmXDSZE1mijRo3aKboOiGWLXoB8Q9s6w==
X-Received: by 2002:a05:6512:33ca:b0:52c:dc97:45d1 with SMTP id 2adb3069b0e04-53678fb1db0mr12278687e87.10.1726675119540;
        Wed, 18 Sep 2024 08:58:39 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53687096890sm1549135e87.130.2024.09.18.08.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Sep 2024 08:58:38 -0700 (PDT)
Date: Wed, 18 Sep 2024 18:58:38 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	=?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
Subject: Re: [PATCH] arm64: dts: sun50i-a64-pinephone: Add mount matrix for
 accelerometer
Message-ID: <Zur4rhyT50lwxE_v@skv.local>
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
 <ZunCysUTSfQU1ylg@skv.local>
 <c7664fda936d36e0d916ae09dd554d2e@manjaro.org>
 <ZuqyuvZ6tdzp5XSW@skv.local>
 <8df5fc79a3e899738aa944a290774c72@manjaro.org>
 <ZurYndjVz7r0U6dz@skv.local>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZurYndjVz7r0U6dz@skv.local>

Hi Dragan,


On 24-09-18 16:41, Andrey Skvortsov wrote:
> On 24-09-18 13:27, Dragan Simic wrote:

> > > In device tree mount-matrix documentation [3] there is
> > > 
> > >  users would likely expect a value of 9.81 m/s^2 upwards along the (z)
> > >  axis, i.e. out of the screen when the device is held with its screen
> > >  flat on the planets surface.
> > > 
> 
> how I read kernel documentation.

Hm, I think I misunderstand this part in kernel
documentation and you were correct.

> Picture 2.
> 
> up
> 
>      +--------+ 
>      !        ! 
>      ++++++++++ 
>          !      
>          !      
>          v      
>        gravity, Z
> 
> down
> 
> Screen (drawn as ++++++++++) is looking downwards ("its screen flat on
> the planets surface"). Gravity and Z axis point into the same
> direction and it's expected to read positive value.


Sorry, for the noise.


> Actually, unless my analysis is proven wrong, perhaps it would
> be better if I'd submit this patch in its final form, because it
> has diverged a lot from the original patch.  IIUC, Ondrej only
> imported the original patch from somewhere, without some kind of
> proper attribution. [4]

please, submit your version of this patch. I'd be glad to review it (I
think, I've already did)

>> [1] https://rimgo.reallyaweso.me/vrBXQPq.png
>> [2] https://rimgo.reallyaweso.me/uTmT1pr.png
>> [3] https://www.kernel.org/doc/Documentation/devicetree/bindings/iio/mount-matrix.txt

> [4] https://xff.cz/kernels/6.9/patches/0221-arm64-dts-sun50i-a64-pinephone-Add-mount-matrix-for-.patch


-- 
Best regards,
Andrey Skvortsov
