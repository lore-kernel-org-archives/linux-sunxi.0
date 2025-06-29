Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 433D8237707
	for <linux-sunxi@lists.linux.dev>; Sun, 29 Jun 2025 18:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751222260; cv=none; b=XVckFTKM79jFOdVDmDAejvchtqFSya6UQ40wAN9MKoKn7i2VtdHUYI7omKXFZw0uwNFkxQ26rpZUs9/81x3yTXi7TUZkhpjCg4uoIVExPbUm1FdRY/36gtPk5ph5YDyHRSM7jAyYhVBYRMvpYbyUERV3uq2CwuD8L5F2ENLzeY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751222260; c=relaxed/simple;
	bh=KanBzgbYjUGn8O9OHjq1zRnau02IuNRheXp0DCUghdU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UfHNZvcJdNoqFoWvIeDbAud0ORZT0p2lu+G/vBKdcq82GCmnL6BXwA5GpWKb8XKmer5JN3DUtP0BNvp0XWdc1EWqVvPGcLU33i6uB3+PoYy90hfr0z/QWnk3lYF5e4QJC2uUqFoSHSMNqPzdZ3pVGzn36zqA3014oNzEQKRldZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dUDm0YJ0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dUDm0YJ0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-453398e90e9so10513685e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 29 Jun 2025 11:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751222256; x=1751827056; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=j8592xP+JE6KeCXGDCqNX8dsf7ApqXKNRZpKKe+gG7o=;
        b=dUDm0YJ0YejWYmsiOT9n5Osep/bkT3JHjsJ1+eR8RIsIhqPRU+DSX2jqHb9ZcpItDu
         pU1lkq+ustEq/VtZHOr1U6e2wrBUeIebzDsid3EwmHWw682In2F49AEzhXzHO7wvmWbi
         PIdpvPx3RHRWv/GkmpCEfBBKb9mlCJUZMtFdxekb/OdgZjXy+clhqWZeIoagIBY2aAZ0
         qiiw8X0VUpoQkDPXGcVCKGLmOsItVa7P7IhGr7DkD4Hp1nd863BDWoO+SCzTohYjPe4W
         wgR9NrV968iGd9+JMttGhkLuZhpHVqm4q/9VsYvJrocvxPqlCMogwmxRiXCWamrnWcWs
         gggQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751222256; x=1751827056;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=j8592xP+JE6KeCXGDCqNX8dsf7ApqXKNRZpKKe+gG7o=;
        b=X4d18c6Q3x9Imu/7zYxsigsZCZM4rlXPkNcwDWPx5Xowy7JEtvyLhYIft3Wc/8spOr
         uQ+tS0jfg+lpWzGAHganWn5SwQTfGqhgLvaR58UhuzLQJDqrFvFcUL7QGWLc1qIdU5oy
         JRYFVZcnPA2ZfhkghqLG7doDHOjwaRjSEJyWPJ64IvFeKBy9TOIYZjGrU41gl7q6Xc6T
         YI/HCbORYwvDbMZGMMcpUqgwaUp8jcljSfst2m0BxvbVO9zEsvwYwEP3VVPK8KKitE56
         EZ7qu9uhptw/NGUd6F8PFDdWpJmnWMaJBURbz5LwKymuE6Sk+eV53jXmqihAZqxJzRxS
         VAvA==
X-Forwarded-Encrypted: i=1; AJvYcCUYjmV4NQOi5NCnjY/ymJx2/W2C80f8nE8CyG2JyJw8LjxKXnNYjOzti/vJG9wNssiuTh/+Q0wQm1TvbA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxQr6BqAo6BVWcW2A4ZSkDdW2lWZOra58CdjsR7Ou7ZRDgdU5hz
	OGtSmtOH5zJxnm/EMIUqoBRwIcyXkD7wjMS5GYdz1PDUVqtpiUdOQLGu
X-Gm-Gg: ASbGncvQyRriDeKJO9zNimNvxe54UMO1mZ8V1OfKP5sIXkRVDRlhGfXj06gq/GtJj43
	vNfeiy1o06JYejON2DIFFLK0VsfZMq1kTeEaT5QJyRvoUhng7atCaClkTEmXxMxrnA9rwUQNXzx
	AjLIww2aDe0PY0/IJlzuX6w+MK8b48bJMhwfhusREpV5f0SMKV5u5eTcb2WDhOFVIE23xR2GGKB
	dpvvxOTRpcLZfMG1jAlEo+wbeGDj+JxdFf60XPGRzldribDRL5z43TT5k0qD8FaVwn8vp0jY7da
	3Q5B09iF5Nrk+J2rWxs71bBvfXPeQuPCD7MnUo1IQwRSffPjccU9aFPwQdsUwc8=
X-Google-Smtp-Source: AGHT+IFUvGyHpZ0G55OgsZ+L5rcXJKuJV0BFFbxOe9Gz1CCPK1gH8KNx/GR6MT+iyUETgIG6fe7iHw==
X-Received: by 2002:a05:600c:64cc:b0:43c:f629:66f4 with SMTP id 5b1f17b1804b1-45392b98066mr92287515e9.0.1751222256133;
        Sun, 29 Jun 2025 11:37:36 -0700 (PDT)
Received: from Red ([2a01:cb1d:897:7800:4a02:2aff:fe07:1efc])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4538233c523sm141486835e9.6.2025.06.29.11.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 11:37:35 -0700 (PDT)
Date: Sun, 29 Jun 2025 20:37:33 +0200
From: Corentin Labbe <clabbe.montjoie@gmail.com>
To: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: herbert@gondor.apana.org.au, davem@davemloft.net,
	linux-crypto@vger.kernel.org, wens@csie.org,
	jernej.skrabec@gmail.com, samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 00/10] crypto: sun8i-ce - implement request batching
Message-ID: <aGGH7RH8-yHVVz25@Red>
References: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250626095813.83963-1-ovidiu.panait.oss@gmail.com>

Le Thu, Jun 26, 2025 at 12:58:03PM +0300, Ovidiu Panait a écrit :
> The Allwinner crypto engine can process multiple requests at a time,
> if they are chained together using the task descriptor's 'next' field.
> Having multiple requests processed in one go can reduce the number
> of interrupts generated and also improve throughput.
> 
> When compared to the existing non-batching implementation, the tcrypt
> multibuffer benchmark shows an increase in throughput of ~85% for 16 byte
> AES blocks (when testing with 8 data streams on the OrangePi Zero2 board).
> 
> Patches 1-9 perform refactoring work on the existing do_one_request()
> callbacks, to make them more modular and easier to integrate with the
> request batching workflow.
> 
> Patch 10 implements the actual request batching.
> 
> Changes in v2:
>    - fixed [-Wformat-truncation=] warning reported by kernel test robot
> 

Hello

Thanks for your patch, I am starting review and test it.

@Herbert, please me give me time for it.

Regards
