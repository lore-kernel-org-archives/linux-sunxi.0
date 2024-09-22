Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511A8EEA8
	for <linux-sunxi@lists.linux.dev>; Sun, 22 Sep 2024 17:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727024515; cv=none; b=DGAGK7FSJMo38TRrCh7PFs8jj+VVWRegvm2vf7/16/Mhp14IBA37oIFL2E0BduzgHw5R8OEYqG9U6o1ng9JTcFlR64rDGDP7xpSA3SLLq7ExdnFDtLJqDPrJqI5A0N9utq8UUt/yFqHGAqVAF5Foh0NdA0Of/oMJeQn9sWsWTEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727024515; c=relaxed/simple;
	bh=W0Q3t1cD54SXXSBH7q4jVSfQ0CDLGNlbuw5viLLpA7U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O1KrcMoUqgV29/8CyWKcQjp8DwrmG706NVuBlHba2yA0ZO3N5scsSe1Kb3zXwmz4CCLllm2iIaSYrmlKGJmEbLFXZVFzAdt8SFvyagzbyZBwD+o2pO8NLRG18zjmEOQ5+Z8HtCpuxR69qOvXZw4c966soxlRueQCWHDIaH1dtOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iGqHmwAr; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iGqHmwAr"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so28006765e9.0
        for <linux-sunxi@lists.linux.dev>; Sun, 22 Sep 2024 10:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727024512; x=1727629312; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e6OYj2UJLtKO0PzA2lDG8Hf51QXdlmbxTS6bMeQGk50=;
        b=iGqHmwArOF34Nz2nyagE0DQ0CnNisH43PJcjdoMRDe6AufKJ6uUwbejHGxi44TiGq6
         MC7Inhn5U7pJWuKHsSUIM1r5kyNA2Pfo309CekhjeguMFCTRe39dJ8lkfhQA2FGtroc4
         dQ1v8YwjPkrkqZ6eOZ/o4VvnU7jneZp1R0kXg0vje3ScPsDH0cM26ryXcAO5+RdSZx5E
         MiaWLS4bP0qYftv3DOP9a9OCUx1yS7Q9lLrZuAI401L9BMwpSUhifzwbkkLCeRcvwGmJ
         LDx5fanp8ocPlYhDIZ0M9FofcgVBgRtF7SUWajgQP0UU4N3YqhhgEPq8HruVUph6dPnR
         PxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727024512; x=1727629312;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e6OYj2UJLtKO0PzA2lDG8Hf51QXdlmbxTS6bMeQGk50=;
        b=tcumJsniMNZL9Cft2nHCw0FratH9bYAIrizhKK5h8dJe0eBapBXQ99g6QqNWlJbnFp
         +1dGGnXFeceYMaCAEjfgE1S4nxcP8poAdqZfWHmAnM2iQx52VwydeW+SiSzWh+VOmAgg
         9vtTR1yUdvZeNnljPjUMPyBmc7tVPop+5dmSIsKu8RGr+EnCV1FymZN9y2l08s626S9W
         nKbI0kSlTsQsdFlO8+mw7W1xuYCPqZEDkKo52DJ/LZYZ8l6T9tmP+3Us4c0d3Mo7QRSm
         awzNrzWrvC5vn78xn0xGeAWqbuEX+m1tR5a+UvSoUSReQhEBgYgcwCEw8oyNkZOzgsIq
         kDPA==
X-Gm-Message-State: AOJu0Yzhmo2w+Qt+/IoHEu2k6/v2nB00eW001QiKY1IsRCDNRixe7uGC
	9ttrsiVBRCAJ7Qbffdt8AY0s4yVigw8U5rZx32Pmj0JZLHIHLZyI
X-Google-Smtp-Source: AGHT+IF+lPG/TGg29MYlU3BmR+FnM5mK3gvHfmebpJCRc6aD+5GdQAF0EcnCJztjRJv/IukZAZEtFw==
X-Received: by 2002:a05:600c:358e:b0:428:1310:b6b5 with SMTP id 5b1f17b1804b1-42e7c1a3916mr61839915e9.34.1727024511350;
        Sun, 22 Sep 2024 10:01:51 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e754c643csm104582835e9.45.2024.09.22.10.01.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 10:01:50 -0700 (PDT)
Date: Sun, 22 Sep 2024 20:01:49 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dragan Simic <dsimic@manjaro.org>
Cc: linux-sunxi@lists.linux.dev, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, wens@csie.org, jernej.skrabec@gmail.com,
	samuel@sholland.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Ondrej Jirman <megi@xff.cz>
Subject: Re: [PATCH] arm64: dts: allwinner: pinephone: Add mount matrix to
 accelerometer
Message-ID: <ZvBNfeg9uowsM9ub@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dragan Simic <dsimic@manjaro.org>, linux-sunxi@lists.linux.dev,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org,
	Ondrej Jirman <megi@xff.cz>
References: <129f0c754d071cca1db5d207d9d4a7bd9831dff7.1726773282.git.dsimic@manjaro.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <129f0c754d071cca1db5d207d9d4a7bd9831dff7.1726773282.git.dsimic@manjaro.org>

On 24-09-19 21:15, Dragan Simic wrote:
> The way InvenSense MPU-6050 accelerometer is mounted on the user-facing side
> of the Pine64 PinePhone mainboard, which makes it rotated 90 degrees counter-
> clockwise, [1] requires the accelerometer's x- and y-axis to be swapped, and
> the direction of the accelerometer's y-axis to be inverted.
> 
> Rectify this by adding a mount-matrix to the accelerometer definition in the
> Pine64 PinePhone dtsi file.
> 
> [1] https://files.pine64.org/doc/PinePhone/PinePhone%20mainboard%20bottom%20placement%20v1.1%2020191031.pdf
> 
> Fixes: 91f480d40942 ("arm64: dts: allwinner: Add initial support for Pine64 PinePhone")
> Cc: stable@vger.kernel.org
> Helped-by: Ondrej Jirman <megi@xff.cz>
> Helped-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> Signed-off-by: Dragan Simic <dsimic@manjaro.org>
> ---
> 
> Notes:
>     See also the linux-sunxi thread [2] that has led to this patch, which
>     provides a rather detailed analysis with additional details and pictures.
>     This patch effectively replaces the patch submitted in that thread.
>     
>     [2] https://lore.kernel.org/linux-sunxi/20240916204521.2033218-1-andrej.skvortzov@gmail.com/T/#u
> 
>  arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> index 6eab61a12cd8..b844759f52c0 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64-pinephone.dtsi
> @@ -212,6 +212,9 @@ accelerometer@68 {
>  		interrupts = <7 5 IRQ_TYPE_EDGE_RISING>; /* PH5 */
>  		vdd-supply = <&reg_dldo1>;
>  		vddio-supply = <&reg_dldo1>;
> +		mount-matrix = "0", "1", "0",
> +			       "-1", "0", "0",
> +			       "0", "0", "1";
>  	};
>  };
>  

I've applied the patch to next-20240920, built and run on a
device. Sensor now works as expected. Screen rotating in Phosh
according to the device orientation.

Reviewed-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

-- 
Best regards,
Andrey Skvortsov
