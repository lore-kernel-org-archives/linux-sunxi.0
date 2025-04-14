Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 907CC28F937
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Apr 2025 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631809; cv=none; b=Bas2lABb6eF40lbFUwmIvSVTkufjwReXXBqfJ9bE6VJGVjJEgyuLt+rgq9LIMEy0/0HJGtsZabymPZJfGNX9IjVE0PwIL6W3m1r7OWlxU5GPpmN+Dvb0ZTU1Iw6TJxEIL4G6tTbVrrTVkUDNTBVnRMFAydcdLoXdeOC2yQdg+E0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631809; c=relaxed/simple;
	bh=3sEttiFjBYbDYr+5eBpF/Y/XgXUE7by7730ApTqP/BI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=upnk1WCN3WNfD7c2ywBHGJ9Safd3W56pc+HzJ3Of0Jjilf0mSNS+8gi94gcW6ypJh5fGKz/r171z1Su6b5KoSgkgNUiX5P7dsNs+toejhap9FZGJ39gq96j4hgfQZCgghhQd3qKJA/M+mDZCTwN4sJERT0BA45iaGp3ihX9sMi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hCrLphxO; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hCrLphxO"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-391342fc1f6so3492413f8f.1
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Apr 2025 04:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744631806; x=1745236606; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=27blyDXAmQsVOsKFI9FbgvEj0N3VDQZVe4EB+Ij1Y8E=;
        b=hCrLphxOt39g57+K44c3Wc0Tp59kVUkW1m+dlKDKeqFizQTf+facHtJY63sXTYS6uX
         d6ka6uyZQKwaaG03LJv3CCpqUB3zaVMig5ryXhkERCrRphs/erMDxNF4/4r8QdPBaFXb
         c4AuJOr59tXNK31z+ouLtwPxgTCWIFNuozw1PO8OrNlo9jqH4SXibCXcBVj7Y87Enj5g
         8G0rzTmCLUseNLvEbQnel3DyoTiByGisJE/0NxVpJSiTWxx1zp/fhUQUnLCweEQwsStZ
         o5hsCDdNEIXIdoFJSKOpl1MllcLWwmrM0O6QsHkUvn7refOmVhb6tGw7W78z4PqDKRFC
         iqVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631806; x=1745236606;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=27blyDXAmQsVOsKFI9FbgvEj0N3VDQZVe4EB+Ij1Y8E=;
        b=fZSvDiDKGl5p4a1uHuzR4BfbUai5dZw8biGq1fcwhMmS9ierGgVNyAKxUTXgne6sg0
         cgc+7U1QQQa2FXVloVEhwd1wDFeFUJdQPmhSaKnBaLgYQcHHNny1RNjsFozwTxefHSiD
         6g3I1R6UXFirAsfTaiG81gCaHHGTXD+UWj+4h2D3dMOw6buo3MyfgsWV/9lknwSLKrPa
         zkPHUfMJPJMjxmWJFZW9N9zOJo3NDa7zUkzK1BZpeT4IS+BmWhpiM9nRXMzgcxPmw8pf
         40qjGZW8Xovgq+AeT4wkYEoJUceZGX1KoXUGp7pPhhTrrgqi+BFbSlpwO+tZs+hH4blL
         phMg==
X-Forwarded-Encrypted: i=1; AJvYcCUGA8wnTGj7mW1uCbm1drKDsCXg1PlMABMbckiov9npRxqjOZyQMHthBiAMhZG18qhcev5mh6ufTnp7dQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxLPL5DIkBC1MGMT8I7h3j5+N9lhF2X69SNQ9/1pYgzHiWGMDN
	uWxzAKo3JJA/EPWb/OM8DmsoA8VAHkdjogz1PVJQFhDH6JZ1IFZ4
X-Gm-Gg: ASbGnctIaT5hQsF0t+hy2GlTfBq5D3anwHvYkdBpY6FBdCan4l3eZ6ZSejMndq98pLl
	EH49iwf/B2cwOdIh40PTnln5GgE2eP/giuBqDfn5XzNPpmH3P7X3AyHDwSvmcFtpwCgig3TIPQY
	ycNMBKR/8OkL6k+eRepAE0AZo4aPjnGIMVT3I4l/h0S80ryPA1FMX8M2R97zTTnVY7pqAGfsXb2
	UYl0cYYYWCEFDjboxOMNiABx0D+rOmzSUER+Xv2YGqKso1YqCJntvbJdDVgnvowE9Cf9i5GbS02
	MStm3PukJZRIpY2+Cbcy27pF14lZfmpjQiqzF91P
X-Google-Smtp-Source: AGHT+IGj7Vl3mhp98LI+iMc6cVdaQkfgWL6li+cKl/2bRIaqhFJ3JwH9UyrUXt2MUMKwXfrTR1rG+g==
X-Received: by 2002:a05:6000:144b:b0:38d:e584:81ea with SMTP id ffacd0b85a97d-39eaaebeadamr9595715f8f.45.1744631805537;
        Mon, 14 Apr 2025 04:56:45 -0700 (PDT)
Received: from Red ([2a01:cb1d:898:ab00:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f23572c4esm176735115e9.26.2025.04.14.04.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:56:44 -0700 (PDT)
Date: Mon, 14 Apr 2025 13:56:42 +0200
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
Message-ID: <Z_z3-kNlDoh4ly9T@Red>
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
Hello

Tested-by: Corentin Labbe <clabbe.montjoie@gmail.com>
Acked-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Thanks
