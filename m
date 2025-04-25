Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C6E256C71
	for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745587704; cv=none; b=XtsgHiUU3KmQquq9KPCA5m6RMxPP/OB7S83SrJQDPq5FLIpwl6JMM8kDMXZc4MrqOjQFmGCb7UavLx1RwYk5N68wCSdTQMkIKmZJFL5+u8ovzR3xxetLpWT0pIS12VDno3ilVJ63SAIIUrEN7N3alze1bk8XeXha44D7j5x6i3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745587704; c=relaxed/simple;
	bh=mDs1kublQxCA1O7cB2fREvwvXpYdNZzxnOO/aSHfTbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VyNDpb6fM25rm2D9p81mtZt15iXqW5yqhYwfYIMZmIv7mR0sxn/HaVF6jyHOlljF3zono8I3s34aqyVGX+1H6UIGmhm1r53yZ030pMbkNLoDKqxtq9+rtHRrChrAdA+2lZNgItWQmkFhMWxZCu3kWPJY1WGqCAUF8rGYRx/MapA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VTEd2bIK; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VTEd2bIK"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso1506169f8f.0
        for <linux-sunxi@lists.linux.dev>; Fri, 25 Apr 2025 06:28:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745587700; x=1746192500; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=aug+uhhO10dT8SA1KkPf7sPRP/dd7tZddbirMjYFdb0=;
        b=VTEd2bIKzlTF1RVKDSCijM3E6gSUC39sFyvFK84zUxgJ+CUUD/gmOQ6KCKFXGkGfSc
         b2Of4uyvealmC3ALtSVi7J+ZJGGiXHhvINBvQHfyjzL1tAhlnmf+4Cb0xIoL2oxpPM9x
         tBzphhcXoh3PQ9oHHtmEb/ruWuOZTzU6XlfTrs2EXRIpXy3fYP1BmBsNAba1ppGMFYTt
         06sjmSIcryIRZbLYFN3ot2Sqbh5z3fMmx8JYoSgWB8ME+a3QaVPj4eeMPNVbXZ3jHr83
         6ahD92rgTjvXtUmQyh8KpXQT2+xVFJJbPIy/sMk+FaasmW7f2Zv5lg4cKpQdLymyRTsv
         FkeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745587700; x=1746192500;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aug+uhhO10dT8SA1KkPf7sPRP/dd7tZddbirMjYFdb0=;
        b=UNSIqr5C6s51HgXc2XPDO/MPaD1XDP7Sfz7FWUCagbM8qjt1KZvA0K2Xv47xaSsBCf
         JWGfFiCLg6wqI2Wdvjo1xtHbz+ch3of/cu0ZSOYhDLu28S8A+yGQBE7u/+5jrvyNLeNt
         9UzY7vxuwtVa1+OFQJEyUixRSe8iDgR9RoWpqCVpyS+tE1nec+Tb0g1n49+ZYUTeuBgA
         SMXxhZWKOFbAKPJBBtgr8jCO/vDGPQPz4qWNKUDY/qYb8rr2PzhWRFfweXOF4+j6Pt0v
         zMbb4PWHmxUiosHHZnAZ+lRxRbYfVkfK1eMY+etIGMip83K3hJ866MVeQClqSb0Hz53q
         MKZg==
X-Forwarded-Encrypted: i=1; AJvYcCWge1m8iwPAebh7j5rAvFNilG4lxwH1HAE+VI2jDhTnXUpLQSiJn/xyqvlyvHmIEGdwFCMQiKAMgQQ6ww==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKK4lzJRJTV6JWy3mw6KTW2iW2bHfqH50DvcSk1jHpED34k5d2
	QI4lr4Oct+er0RZ3C33eX1PnA7P7Yvk34J/dSPcykY3N4ouTfJYr
X-Gm-Gg: ASbGncufhdZoRrI/N61LQ/fX09XLW/fyRH881+qpHkuDpt8D+l/wcouQ6aqu/E6aj3T
	5l5rbKBj0jTofDJYdC2RwXXg63/KBnOylXKbOG83OkxWenUbeg3RCVhZDhtypd4DjYWJZqUoN8B
	gW21YVSzEIL+yy6jRDhJ0Xa8Xk9/fc79G6vo6VzezrU4BtSCSywAyfXQcb5goigYjRzpatSALd2
	+6+DYAeUuk8aYeNPBtS1FmfKbfS4J3q1Yt6Jv91NoNgYQ+AH2dOr0wy2q/WiumeuIv6YT4X7z/+
	6hN0jtYk/ejpkg8wvso8chPfh9epAx0Y5RTyMWEYeDtZnSA5ci+M
X-Google-Smtp-Source: AGHT+IFSGC6ia6yK5H9T8nOwC67dP5jiFTss/M9i30fMyhHSIu9i6Cr1xRw6VNVbGW1I/F1aUlxm1w==
X-Received: by 2002:a05:6000:144b:b0:39c:2678:302b with SMTP id ffacd0b85a97d-3a074f14a59mr1999330f8f.45.1745587700424;
        Fri, 25 Apr 2025 06:28:20 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a073c8c7fesm2394207f8f.6.2025.04.25.06.28.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 06:28:19 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:28:18 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] crypto: sun8i-ce-cipher - use
 pm_runtime_resume_and_get()
Message-ID: <aAuN8i5p1HlEkFn6@Red>
References: <20250425124517.2225963-1-ovidiu.panait.oss@gmail.com>
 <20250425124517.2225963-4-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425124517.2225963-4-ovidiu.panait.oss@gmail.com>

Le Fri, Apr 25, 2025 at 03:45:17PM +0300, Ovidiu Panait a écrit :
> Replace pm_runtime_get_sync() usage with pm_runtime_resume_and_get() to
> simplify error handling.
> 
> This is recommended in the documentation of pm_runtime_get_sync():
> /**
>  * pm_runtime_get_sync - Bump up usage counter of a device and resume it.
> ...
>  * Consider using pm_runtime_resume_and_get() instead of it, especially
>  * if its return value is checked by the caller, as this is likely to result
>  * in cleaner code.
> ...
>  */
> 

Tested-by: Corentin LABBE <clabbe.montjoie@gmail.com>
Acked-by: Corentin LABBE <clabbe.montjoie@gmail.com>

Thanks
Regards
