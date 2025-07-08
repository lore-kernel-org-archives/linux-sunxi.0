Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D462DCF48
	for <linux-sunxi@lists.linux.dev>; Tue,  8 Jul 2025 12:58:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751979519; cv=none; b=shXeVD+VPgWaDIOA9AMLwGNdpV5W7oukA4zk+6uZK2tCFhIQgg3EBB3qjmhb1A4/LQio22CpQ4XgtgzLG9nt0DiXYE5sy0/rLKCEvop67PzqwYF9HIlXOiUTu2wzQaaR1WxO250N7GMYMZN42p4lCwXVJJsJGWmM0ScS6/liftc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751979519; c=relaxed/simple;
	bh=U+KD2SfDixKcBf4nlRtTUsKZNe6YPFFReciXtdVOck0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tHR0N8RcQTypidm6n8KzMEWpaa6RIZdO6tYSYjXBq3d4nNiplY4AGF7OSEsH6TcEbQkiNJ+glsbMwqy0DRoZjZkeg2PCwmrrFCo1HG7CttXwAf1Mm46kIHKmB/UmzFu3QIVWhMwV+7bn3m5Q3Y6B/3Z1fPa69Q+f4SiUPUtXAVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hnybTNk5; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hnybTNk5"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so2919208f8f.0
        for <linux-sunxi@lists.linux.dev>; Tue, 08 Jul 2025 05:58:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751979516; x=1752584316; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S3jJ8BMukDKm1ntMLDCU6/IXiTPsV5zOI4ZOEY7XVrU=;
        b=hnybTNk5FmzqCFALZ1LmqqYHZ9WCuOabxThLV6voNd4qgEOKzHGDDhcNqFwrs7U8fc
         o8XsLVQq8rCt7QKUWQCFf37WS6Zsr7qh1PYCuZQ2j/S6s6DMduMWPvhbw4yk3NGn/Mld
         Gx2kSM9geqVgRJaURebO1x94zeYopOBFyYnJ6jLyEDPYm+4bhLEet1WaNe0Ldz+8LLX/
         1D5kuFzUoQ+r4UKsnQnZ1fi7JqKdf5vIUNgykmnIAVYo03cBav3ieNAdezhSAe/I6TUm
         3q7zcfLfLBliPXZFjd/Uxy5zN9PbUCZHZpDCJfl6p2vxBznObKEnHiwyKdVP2LtJU4UD
         VIJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751979516; x=1752584316;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S3jJ8BMukDKm1ntMLDCU6/IXiTPsV5zOI4ZOEY7XVrU=;
        b=UFcLu5p7EIJkPASyt+N4OtR0zsAkAQZXQ/KpiS2oIZ+K9yF0+oW9RaTSQ5dUS6Kxw6
         9ggVlXlD7fF9HefLXS7H3VYmXYaHCOvKkxDRQJIx03eKJhxPHSRc/adgME5sWnnFuICk
         weQZ6HXtmkZ+Ul3Y/rfCfJtAgWlkEUe+X34MsXk1UKzpHWpVGnFOsC7nTfkU0cKoXvpE
         pqMprPRVH1JG/8j6ateWwVCYyIw0mC5uj1IzFrLoy+QLZ32RU+GX8Gp2lcWSeDRIDAlB
         8OxIk3P85NIOKwXeeVTzGT49zPcKXWtgwWdoQTg5I+xwVdF9mRoE00zlolxuZK4pSgJo
         eOmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWykPqRWr4UcW5jGdYXAz3qOtanYU7CMhvcVUK/dMEiO3uGqVSqhsSs/g+BSGaIMpDbE6oSmGY+7sV7vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzC2n5612vgwu2BlFRCxkEQ124BP56V/cRpjwoqOuBYuMIXF6jb
	j5EWPV/qy1JST53qgDWcISZ/F8pDONPIFPpMnGD72fCcRqpWB/auxzxk
X-Gm-Gg: ASbGncvVCt+BAwmlI8Yj2etpuWoDJ25dutEvW77r5qIqsWS+t7vEnpY+i1KnQSmxs1R
	0muHmCOwY6fhvAhLvrz++amn/9hU6asM2Jlnf4cvIe+CaHJXAxxlZDbeeGUCFmgrmvvffDBXmtA
	/aNaoRjljbvshr/rb0vCb4PEz8IaiG59JCGLy908GvD/UCBQNxgQTFPTFadE45tZEXv7WEAOhwk
	UIP1CrrmzoORYNQrXUl++TfgN3RKDhE+XsSprDK2wpEOxKq7ek7uYcqZi0A0mgcZSL/pe4xSihy
	mYualuuOg6x507qEGun459PMEcU9awQfGAh+i/AdnXcGsi150ui5OYLjdoYcBP5qpAGDmC7mBA=
	=
X-Google-Smtp-Source: AGHT+IHN7LDQiiQu3mRLFgDwPBd6uS5/8IY+itp6iFFjd+pue4GlyC58MYxMurBFSzPsD4KJPUtVaQ==
X-Received: by 2002:a5d:64e1:0:b0:3a3:70ab:b274 with SMTP id ffacd0b85a97d-3b5ddfcea37mr2397438f8f.12.1751979515491;
        Tue, 08 Jul 2025 05:58:35 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-454cd43f0dbsm21985665e9.5.2025.07.08.05.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jul 2025 05:58:34 -0700 (PDT)
Date: Tue, 8 Jul 2025 14:58:32 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] crypto: sun8i-ce - remove channel timeout field
Message-ID: <aG0V-P_Zvlzhi2i7@Red>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
 <20250626095813.83963-2-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626095813.83963-2-ovidiu.panait.oss@gmail.com>

Le Thu, Jun 26, 2025 at 12:58:04PM +0300, Ovidiu Panait a écrit :
> Using the number of bytes in the request as DMA timeout is really
> inconsistent, as large requests could possibly set a timeout of
> hundreds of seconds.
> 
> Remove the per-channel timeout field and use a single, static DMA
> timeout of 3 seconds for all requests.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>

Yes, timeout was strangely handled, thanks for fixing this

This patch is:
Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Reviewed-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards

PS: I started to review all patch one by one, sorry for being slow
