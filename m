Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C576C31E83F
	for <linux-sunxi@lists.linux.dev>; Mon,  6 Apr 2026 21:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775511083; cv=none; b=XiV31Rb5GRG2SQC/xwssiHjn//ZZOYnICmZ9JDu+Vf7q/45X9EIusUWP3n+ulKexcasq5LpD2wTxwEL+/yZ4v5hzU2+S90oy4iG0p8kox9QD60AC99o+kBsB3zDgSdNbMV0keloesqRTv9mK8iZBNt8SXUerlCx8OAeDwcDAb/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775511083; c=relaxed/simple;
	bh=5lEmVosmeuBFQdJSXSghbeCTHfp905dvVKwXttkmT3o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NAsP9zezMbAU1xXfNMoc3BOJOOgB3SJnuzMwJBzUOGsdpCucwJ0zdUGtlFs4dO00lPM5qNJ7SarWAirkt2qZGA5y6/D82KVnbB/unHKuJPCj1trc9inFkW6nQovNb3DiucLw0KQoO0zFMlP1k/qSNXdWaUEpG4ckPdU4HkWEUc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YBSmFdIW; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YBSmFdIW"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38cbb1ad0b6so37076601fa.2
        for <linux-sunxi@lists.linux.dev>; Mon, 06 Apr 2026 14:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775511080; x=1776115880; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GyThv2DxbTG/BKeYrv8aDgw2xYo6966hqmjyrursIqE=;
        b=YBSmFdIWGgI7SHv+Rrbj6oq2CWze9t6W3lca20496Qp2UCwwaAvReFdD7+t+EVjf8n
         K3m1UwYgDHiL77UPJqb5aEuSGUYUodJIt1wZxgQQZb+r1uL5ELR0PH4yepTwGyix+Eu6
         8NoKld+XXCVtgfCjFH16nayzMoc8Vusq0Gw1vAoajeFBVPXzQ4OVNKg1p3zpfYRq+ilh
         0PRKdj89dCXlPO0ixxQzY2O2I+0nC/bgg8AkNhMQp/mTG5Ssrx/tJim+/ccew4nhFb7+
         v7ef1lx7DfSCtsNmvpqzDC2wiH4q2WOSb/5871LAIa7XHFmUGuC2OA/Q3v5zzmuNEeMb
         MS8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775511080; x=1776115880;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GyThv2DxbTG/BKeYrv8aDgw2xYo6966hqmjyrursIqE=;
        b=Fq+P+10Ilt30Wj2Rw4T93q5PqPVH0ihxeOwVNQfs0RKmsU2XcDrmOPS9IpzTNvYtCR
         mz8FeLKrWVoHyFESruVxXReIXeiggXWfBSvDuw9pO+jbZZXXmn4KKDPNQOFtEhK7LfZi
         3mzAX+e3Y9bSSec0sbzHLdQR5T7hFn88tgKK3DCo6Bsm52y3yiGbZIA3C6ZcNw4ozo4R
         HzV/GqcFiS1BO75Qa6h7br9Rljs42WeVZTyr+xw01dzsFfg0xcusraYBrV8afmZMFxFl
         WhvnfpSS+m/oRS+lWK3yF31heTaOhRWtGZ5BjzxZS2hxy04ZGf2fJ+fhGJC/+Ntr40Ji
         oP9g==
X-Forwarded-Encrypted: i=1; AJvYcCWgMoUVvqmSsm9uvfdibH1m9+5rRdrLoTyOGXjsELFmsg/ylJ8hndzEp4QSblBj0RuyW7Hhd3M6AYO2oQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxy2/S4ZEBGIEqicw0HewHPedQGzEECxgpwb9uAxJpnVwJG/aQM
	MQ35NjpiN3nC45Kp3eG2Q5dCLAHVr5tsG3zWxHanNHVQMXxmtSPqMIGi
X-Gm-Gg: AeBDievI8LB0XLHThfumdLuZ1Txgv2cf9udL8v+VgSxBnt6CjI6euv0bIQSLIqJTAH/
	+99r/H7FSMN1uAtsUt6GKmm0zLdVynLPaCoixZHWmj33pn5QoJeiUbymdkJyCxz0PgKW22F5+UX
	TaU4BlBAMfUHinrmDlYcY4c8DbAUGIkjnObV0CLE2QJKlqioq25C8LWbU9UqE3adJHr8uJTDgug
	glfgoPJ5fA/g+GpyavutNeyYLyx8ph6t53c42nOpwpz2WW9td4k3lF6k8Z5KMQkGN6/VpfDlvLM
	0loC+EwXJyVhoeb+HbnA+5jWJx/4F7iQdAWTtugcs1jLSeuPahkt4kRFmUtndETYQ8KG3B8+ZqX
	K+N/yXCYbbOElv7bR1Yu6pPKIFc8u6RrkdOalAfJaXKhju+hT2J06O9WTFOi/sS1U+WECssywax
	29igxqK4DxT7OEbIbKtaYzKh//u9Q=
X-Received: by 2002:a2e:bc11:0:b0:38b:d8dc:4adf with SMTP id 38308e7fff4ca-38d9d439ed4mr46799101fa.32.1775511079668;
        Mon, 06 Apr 2026 14:31:19 -0700 (PDT)
Received: from localhost ([94.19.228.143])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38cd217c708sm32952631fa.39.2026.04.06.14.31.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 14:31:19 -0700 (PDT)
Date: Tue, 7 Apr 2026 00:31:18 +0300
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] media: cedrus: Fix failure to clean up hardware on
 probe failure
Message-ID: <adQmJhxNkAe-ChRp@skv.local>
Mail-Followup-To: Andrey Skvortsov <andrej.skvortzov@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Maxime Ripard <mripard@kernel.org>,
	Paul Kocialkowski <paulk@sys-base.io>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260401191441.1217646-1-andrej.skvortzov@gmail.com>
 <20260401191441.1217646-2-andrej.skvortzov@gmail.com>
 <ac5oecJ05oZD25VF@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ac5oecJ05oZD25VF@stanley.mountain>

On 26-04-02 16:00, Dan Carpenter wrote:
> On Wed, Apr 01, 2026 at 10:14:41PM +0300, Andrey Skvortsov wrote:
> > From: Samuel Holland <samuel@sholland.org>
> > 
> > From: Samuel Holland <samuel@sholland.org>
> > 
> 
> git am isn't set up to deal with two From: headers.
Sorry about that. The first line I've added manually and the second
was added by git send-email. I'll fix that in v2.

> 
> > cedrus_hw_remove undoes, that was done by cedrus_hw_probe previously,
> > like disabling runtime power management, releasing claimed sram.
> 
> The first part of this sentence is missing.
Thanks, I rewrite this part of the commit message.

-- 
Best regards,
Andrey Skvortsov
