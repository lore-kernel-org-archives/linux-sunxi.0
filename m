Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB442275855
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Apr 2025 14:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744641079; cv=none; b=D3cJ9fRAqKaMguxbOm1+vFypze2cJYhohc4noxNpqxIBmuE+8fKvq+mIJGcpXgTG7OQ9smgpFJVoE8BRq/Z4duIBI76X6NoMyvIkVd0a2Xw20+Yp8/J8NsqbdwMN5XsqWECVTwCXa7jnk8RHuzCLPvEooFkP7Ap1UizV076gwtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744641079; c=relaxed/simple;
	bh=2gXSInJKusrPdd4J5X6NbBlVa5dxF7j9qgzK0PQiHaE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HyCwB369mZoPVYRWRXawNK7cB4vRtrhOl0uU72u7HAT8HPQHsDJJWd7kthlwHiry8IYK+a1UoTMKYEQXkW8l2M0POD0TMGpjyblfdH656W0SA/0Snrv/UCkE8pwjjEtsfLsmBCRbpEVDkue1LjZsrQj8gJrCy8erY71DFbwMF1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U2F3h9Xo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U2F3h9Xo"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c2688619bso2871393f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Apr 2025 07:31:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744641074; x=1745245874; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HCrgWYM3Hgypgkdhg98cFtG7nn+j6jrPiIXWi6bPyp0=;
        b=U2F3h9Xoyb2R06ydnonMnLx5dJQ8MPey6/03rfDUfGWCuVSyCHOuaUnq8KPXYoAF8C
         /Tqw5NyP/7/QUQn3TOpGZdv8Ylf1S9fTReETMjbHTCs2xmj6MjhrVXwZrpJgscG97+C+
         NLIi6qAxMZaN9LRnUnBtI8eUy7s6HsXrTszDKDrZBN2JxnT605CZcoSXpNbnBQg2BYP5
         0mii07ymmRWAaIQANz/x5BJFdT/pJ8Lz2ur/nzL5IrOYIDK7Vdiz6jSTgqz9+ZE+Of6d
         Fc7t22eX6Oc+LCDZuUXXrM7MyrLZ3WL3eiREQQJmKbM5VyQMHBTd1+4v56vAN0YI4WuW
         +/qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744641074; x=1745245874;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCrgWYM3Hgypgkdhg98cFtG7nn+j6jrPiIXWi6bPyp0=;
        b=hXRGIcstfY4N+LSxi2Z6v4TsqPS8Hr6HghsE6v1AwzQfcYd5VTZ1Y+21RUIEZERENv
         Eju8nNLnP5OMTM80GteQwEeglqoUAo1h0NMpa1LYBiCcj28sdu7rg4FIADVMCD3nY9Cf
         duv5q+RT5VvB/MIAYFqm9UrB76S51Y797SBb4VLVUhnYNAe+ab1UVSLd5zSULUWEJg2N
         NOP5Nq7+48Y/6XqHC64iFUfo48aRTVo+rexPvEEX7QC7hTtqy8vNf7Fd0C5jhisDsJTk
         ZmzG6f5WZS3c6m+M19o/miHePL3bfQgzf3C5aqTUlyzYOEq4i1fglhsRM2HEvfrSu1wZ
         z2AA==
X-Forwarded-Encrypted: i=1; AJvYcCWv2Nog+9ctpsp4OICby42QMHXlksxUmFb3N7bIe7XgFcy6Jrp6uiE8rUgK8h0+veLZ8H5pkFfef0IFXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgRgqrf6xyMIXX4X4k4yLOUDSMl8kqm046idBPOJukL4UEC3z4
	utYKZL5gCIQcyp6aj4UwWecEiItUwz4AJTYWDE3SzuwOnVc4CJF7
X-Gm-Gg: ASbGnctxxCRPmrGsisav9j3yCFF361Q1WSrZkYhl7lpKKIixtYcLO0Qykv1N2Wqe56N
	yEMGmc7a5L27McBDIabbHKUmRVt4jVGXfjapaB7vzk07qQX6mO3+0KpsU4pi4mP5g2tD+xeSf05
	oKt344UMOs2VgofuEUsaD3DdMYp+dI//+2iCPNmZF+ywJLiTbxi0oXwu9Sl+vOznH+3VLU5wtIk
	ickiNA+G6Ce/9NoT1AS93uHr/TVCgO3bXHAvGcSOfuWiWk3IsAmThd//T9WmiqZLo12rMX5jMcL
	0pUSfLibwrV0mMe0/6usdqX9/Roj/eHALPX6DaYgm+POKd9Tv68=
X-Google-Smtp-Source: AGHT+IF4cFQXcUsJCUJ4rTn9rXcC4sO3n9nbDC1x24huqFx1CW67qBr8ulhefX4lOvKb92oRjDJHCw==
X-Received: by 2002:a05:6000:144d:b0:391:4999:776c with SMTP id ffacd0b85a97d-39eaaecdb44mr10571104f8f.40.1744641073750;
        Mon, 14 Apr 2025 07:31:13 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-39eaf43cd17sm11246340f8f.78.2025.04.14.07.31.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 07:31:13 -0700 (PDT)
Date: Mon, 14 Apr 2025 16:31:11 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: linux-crypto@vger.kernel.org, herbert@gondor.apana.org.au,
	davem@davemloft.net, linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 3/4] crypto: sun8i-ss - use API helpers to setup fallback
 request
Message-ID: <Z_0cLywDNhlYIQBd@Red>
References: <20250407123604.2109561-1-ovidiu.panait.oss@gmail.com>
 <20250407123604.2109561-3-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250407123604.2109561-3-ovidiu.panait.oss@gmail.com>

Le Mon, Apr 07, 2025 at 03:36:03PM +0300, Ovidiu Panait a écrit :
> Rather than setting up the fallback request by hand, use
> ahash_request_set_callback() and ahash_request_set_crypt() API helpers
> to properly setup the new request.
> 
> This also ensures that the completion callback is properly passed down
> to the fallback algorithm, which avoids a crash with async fallbacks.
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
> ---
> Cc: Corentin Labbe <clabbe.montjoie@gmail.com>
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev
> 

Herbert I acked but just saw some crash I didnt saw in first look.
Please wait a bit before merging, I verify what is the cause.

Regards
