Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92FCB374192
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Jun 2026 06:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782542335; cv=none; b=VQiTyk74dHBLKjJ61oj14XmfNaD+0vjskzYF8I7qy1J6omqBAYlC3LAaPSqgh90y6E7hnloF6lNpxVH4g+ulrdmAKbj4MvLk51AIRo/jb7BjxU73APKdhdw5nBAfMIJJ5OMRwiE8zsli1Zg2M7d/ta+P38N0rHqg9eCKbGXUgzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782542335; c=relaxed/simple;
	bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=m9jblWMLqKeSCE20tt/dC8gB+mvSd0V8IDCuT3RHCZtlDFkwJnfd5IVHXLvb8Q0aFrx/zE2ZsJ7UvJmODk6TpLsglYVpycnvNJrnhXLx2c2yjYaTF1rx+JvlxTO1xVRcwtaks2gIAWAx7iJQ6BunPh8mmovmOAxDQk9YGXNPado=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i+1UbL7A; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i+1UbL7A"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49222fb062bso18099325e9.1
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Jun 2026 23:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782542332; x=1783147132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
        b=i+1UbL7AIrMVtfTBobUQDaHwGnwl1RNtCJXu0/CnhvaHCXrbacYjgHLqW1xe2NuZC7
         2vOzWd2RqtmHK+zWgXLCLcvEB5Mqreicm6EaFFDdfCS5j/f52jUZxHu3f8wDP8PJICLX
         KZzVfKEqQrchFoMmWGP6cYLZDJ9bIkVIjw6FtIKBYxe381NTADttxyLf8+aRbP76su+F
         V0TpnL30zTugXATEmZrX4vnxXDB8nGQPARJtX7SK4Ld1dQyUAAPR598aewFbbOnpbBg6
         jOg/2+lQr5w1lXwYCHP5iE6ZrHmJUds90gwOcarBin9tmhyrxlIhvdaPmPwP3Dsf1fpT
         VaBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782542332; x=1783147132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ParnwBExfgSuCvGNbbNh3YhRq5Zw4wfCqZvmdKMow3E=;
        b=f6Ce8fYeql8p3Jomxwbh8HAahSQ6uw2jWWUG07ortkjHMDxDYfRE9R2J/UrlnL8awu
         KdfJJg894c3V8CF2GN+90/OkpIL/UT5lB39F0K+ZcR40iGy/jT0wutHpGCTOG3MeNEr+
         kQISK1nRyKyucjowu+sMHLDprMaGf44AqutZWPVA8y+4skuK2crR3K5+jVvqRa1cQfK6
         zUDmzmWyya3qbH1fqc+NssyegEClbzOf52cFZzjwUqSPkvRIblk4kVPiDvP3zpY0YoN0
         BxSWNlVy/R9l87JlhI6W8PSLQV0nrOWdzVeGdEk53L83Vreln260rf+8rDtEAEvuFuQn
         zb0w==
X-Forwarded-Encrypted: i=1; AFNElJ804Z7BhAuGKPck3yIdg5Y7+2sD8kVw+rR+ElijGgfoejYl6iC9NWvEzjeTIN9lU5muGhVwBjwOpSzQ0g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxWy8qOwKmFDc3kaEmQmqmz+A5N9ccMrl3lRd4LGUrmJ0cQrUP7
	CG7qioTkJEA5HRj3yB3rZFeI77x560+sg2rIYtdPio6QcIkOOATVthEkFfvTgA==
X-Gm-Gg: AfdE7cmNGwLeQYE+f2kgukw0LWGS9iS3ol3yjtDNcI6hTK9ssjeeFO2tpsqrqqJqSzz
	Tvx/koWZzZJ4h5tCK6y8/333jTPOuPZfJUq2ZNGVR2fErIL8ZCheP5cm+QpiCAzwYTwJD4xsnid
	yhH3meI4sSKKUN72tWYojleQiCzsZGGOiQm0uMQQSrNTfFpbgBQTp5iK/jVfjxwAWqYZHbXnVDx
	t/uB37cz663XZr7hW0c5HPZxucsmncGER82YfdLUIpOdrJxpJKWOP1qEnDxaP97CgsTfXwNnY/s
	eGLoOyAcDVzZw64J0pegs1FcCDjXNclbMzd0Bl2lhsjfmO4TdcFVXQobYRu0YTjPVuKe2GKOA8R
	vK1+L/zB2eBdrUgNY52ARe3TRW+hnCfRpSkWs/4380tDZxIqiILov17JbZ7lxVi82Qo6KPb19cv
	TNCbYTaZPFjSnyYRS6/DvzyxPY3PCY3kBbplRKJtmHA+9o8og23t63o3aDLCMYOPSjjg==
X-Received: by 2002:a05:600d:8499:10b0:490:e196:6574 with SMTP id 5b1f17b1804b1-49266864b4cmr108469495e9.13.1782542331948;
        Fri, 26 Jun 2026 23:38:51 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm67964385e9.4.2026.06.26.23.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:38:50 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mripard@kernel.org, Dawei Feng <dawei.feng@seu.edu.cn>
Cc: paulk@sys-base.io, mchehab@kernel.org, gregkh@linuxfoundation.org,
 wens@kernel.org, samuel@sholland.org, hverkuil@kernel.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, jianhao.xu@seu.edu.cn, zilin@seu.edu.cn,
 Dawei Feng <dawei.feng@seu.edu.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] media: cedrus: fix memory leak in cedrus_init_ctrls()
Date: Sat, 27 Jun 2026 08:38:49 +0200
Message-ID: <3HodGaD_QKy_OLZfdyJ49A@gmail.com>
In-Reply-To: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
References: <20260624085920.578446-1-dawei.feng@seu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 24. junij 2026 ob 10:59:20 Srednjeevropski poletni =C4=8Das je D=
awei Feng napisal(a):
> In cedrus_init_ctrls(), the V4L2 control handler is initialized before
> allocating memory for ctx->ctrls. If this allocation fails, the function
> returns -ENOMEM without freeing the previously allocated handler
> resources, leading to a memory leak.
>=20
> Fix this by calling v4l2_ctrl_handler_free() on the ctx->ctrls allocation
> failure path.
>=20
> The bug was first flagged by an experimental analysis tool we are
> developing for kernel memory-management bugs while analyzing
> v6.13-rc1. The tool is still under development and is not yet publicly
> available. Manual inspection confirms that the bug is still
> present in v7.1.1.
>=20
> An x86_64 allyesconfig build showed no new warnings. As we do not have an
> Allwinner SoC or board with a Cedrus VPU available to test with, no
> runtime testing was able to be performed.
>=20
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Dawei Feng <dawei.feng@seu.edu.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


