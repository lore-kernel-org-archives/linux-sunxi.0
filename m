Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E774949FF
	for <linux-sunxi@lists.linux.dev>; Wed, 17 Jun 2026 17:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781716182; cv=none; b=ZmV2eXb/VV1ox5bRCVeRvrjvbEIJTrLQCtavFrwUBJ9Xwawca2w8zKcatXC4ECi3FR3IaG80yCE9iFojbpSmiLEf09UBhVcL6mkcn93aNUrYrDbp2MpOkUI5RaBY0gQqOGcgcQl6H4Jhw71IG6JS6e714B6G5bK+TG/xy7anDXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781716182; c=relaxed/simple;
	bh=JUnSab4D4cmQCvYGqezRnjMRf9ULW+i5vXU/rQB8eJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s9/vm7hjG8w0Yi1cpgQDpLNVZX+mU4Apev7v4UeGlV5VmVAf+KPdiUsTdH8UotCLdhp1NfehtewQv0JQLA9QAgwLyJJkL+rBTX7nCUS0c6dBmbkosh4tBN4yV44jj/kc+b44zcymCKmLcnM1ELyqe3hK9qS9orosmy1iqYa9aDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WNv2cTlV; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WNv2cTlV"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-490b7866869so61445735e9.2
        for <linux-sunxi@lists.linux.dev>; Wed, 17 Jun 2026 10:09:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781716178; x=1782320978; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JUnSab4D4cmQCvYGqezRnjMRf9ULW+i5vXU/rQB8eJA=;
        b=WNv2cTlVWjW8opWluHpgZRRZhAQhFcHrzM19iqcKBhvmVQJZ1FqENvJybH1hgzLgJW
         5DjIWstTXyFr5dpfWoAnc58zFps6wQllys+PJqEHymVajPA5VY4B43hNOLygyFMGz789
         tvEoniXjDQLh46BWCpWW9f/3b+y37M45rs5C79FWuP5G1zC85Ekw67vuBbxPeZg7mRzj
         jJvl7R/2eU7s+sv81aPJKPA0f63jXaq7bF2Ut6bdX4nolLozziQudWvqZFi1iWcNtPLA
         gc0MyX9wXnw7z3CvGd6EeZxKyVJrE3swNndP7xDxWtqHQdL+nNsXgF6MeYjhPDYhyiKo
         Q/xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781716178; x=1782320978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JUnSab4D4cmQCvYGqezRnjMRf9ULW+i5vXU/rQB8eJA=;
        b=il7ePiyyILiRMbbTTj9Gjh66jqmkex+XrdlvoVuBeY00Xv2mjnghGLNYbzkTM0Ztyt
         4oibTdz0f5xCiCIYabZXaNAaaQFPzQ9SGwfaqmorzAuk7Xv6acUnjsFu88NianGN5Dyb
         QqMgYF5MRVHA/gIhjHn4GlqBVqBrgRk1/eflSC4YZmwSq24E9Fz1dP0ClrHGrLyzR/BI
         DjZxnMqXE3IvqybqoLCO1a0mks8N14LJ90nORcNgHxr+MWJ6VrMruveauK1/PEhp+lYx
         2P3a7qrX7kAvP+ePEFQWk063VQpp6X22lHyFt1g1WELlaPeG1zyFLuJNLaBfgPaz1lJA
         PwCQ==
X-Gm-Message-State: AOJu0YwrwNSGnXiUeQjBvZoUbNJBX/gUrWSy8dVyFHXw9/3RhdoAB9Nl
	iXX1Ju8zNhcb849svI+8Vp4uo1H9hLA23i9fNCWEL3+RBk8MGIeyI1o2
X-Gm-Gg: Acq92OGuOHV4IREdvIQWlNxmWqCD36+adE88ZyxyAmihUk6kag2JAaRXEDwbU0l4Awj
	2gp+kOx5Aea3kXRDuFYS6zadEcXt9Q7CFXPJkXNvC/OMgtx0bO/aAeNLyrtXUvXS8QrnG9lV9to
	+sCe7EuMBGrkotCwP/k6boA++EAbJBbmLTEidGARUiKY6dtE20PENHW8y2jhyg3pW+eZUcpINDm
	ZXOiYeuYLPjR8QvsU7qEHYg9gs/WVNr9nGAF0mlr3J9ZUZJvvalybYMenCmQH/n/kBljFQoWf2W
	KvZu2g6XiBhU3T5qPVOIf+6rS1Vdo5G8WoPvGKSOpBYBN6wAhyZ1ZnQfNf05WEbgZM37UIseW+C
	odzxIwAj8OfMHxOf/sVCZbM00Op6wG0DYUnD4D+OHuCXNtgh8lS96sewuhGmwDhCCMuhuy0QC9Z
	kULDgB4hsNvbAPQBcrhB4Eb3+xiwO8dv6cMo87vtTbOafM4PWN/aLwVb8HfaMGSKsTg2hgYEgx8
	Op+yig6KT3H2gaos4SiUqnAhw==
X-Received: by 2002:a05:600c:3541:b0:48f:d5a0:284e with SMTP id 5b1f17b1804b1-49234132005mr69613935e9.28.1781716178292;
        Wed, 17 Jun 2026 10:09:38 -0700 (PDT)
Received: from jernej-laptop.localnet (APN-122-99-120-gprs.simobil.net. [46.122.99.120])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49236860482sm19462305e9.0.2026.06.17.10.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 10:09:37 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: p.zabel@pengutronix.de, wens@kernel.org,
 Zhao Dongdong <winter91@foxmail.com>
Cc: linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Zhao Dongdong <zhaodongdong@kylinos.cn>, stable@vger.kernel.org
Subject: Re: [PATCH] reset: sunxi: fix memory region leak on ioremap failure
Date: Wed, 17 Jun 2026 19:09:34 +0200
Message-ID: <BoFIpAKHR22rGns4zmN6vA@gmail.com>
In-Reply-To: <tencent_2C7697B076D53BBE62D99B7CD15E77A20C07@qq.com>
References: <tencent_2C7697B076D53BBE62D99B7CD15E77A20C07@qq.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 17. junij 2026 ob 05:16:27 Srednjeevropski poletni =C4=8Das je Z=
hao Dongdong napisal(a):
> From: Zhao Dongdong <zhaodongdong@kylinos.cn>
>=20
> In sunxi_reset_init(), when ioremap() fails, the memory region obtained
> via request_mem_region() is not released, leading to a resource leak.
>=20
> Add an err_mem_region label to properly release the memory region before
> freeing the data structure.
>=20
> Fixes: 8f1ae77f4666 ("reset: Add Allwinner SoCs Reset Controller Driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Zhao Dongdong <zhaodongdong@kylinos.cn>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


