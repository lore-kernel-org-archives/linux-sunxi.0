Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E90936E47E
	for <linux-sunxi@lists.linux.dev>; Sat, 27 Jun 2026 06:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782543309; cv=none; b=oQryPw4zhWKzDaadz6lBF6GszLSBIJZmrxZqQhmqD7mmxEaZyeVVDV2XbPfIouHjMvpKCgJH/1Yq+8dIA8AXvJBsYALGR47VYC8LnnnwVBrtGOZJM5uGytg1hGg8F2gaUW3gBCPp2tnsb4VEoOLa282IK9FhQb2YhxFO6GlY8d8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782543309; c=relaxed/simple;
	bh=a0YInxvP9vIxrkKOfsq0a9A7RdBzE89fDRN/Cs8YIhM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=af0Kp1DC+ky/J23x6nT6n8ziD36I3NVn6ASNl5rvV0Nc9Js8QE+MQQERwFyqeOKnxqtBzNGfg+T5A9Mfspb0MjFkuTggvjuXv+yvWiVFnIXb53PWG4JWeWrOX+E1m/SHexX70xpIOkEc0dwZ3nvmWoWUVgVkCn+yC9eESr+N+oY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byeFseAL; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byeFseAL"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4923139e940so9497855e9.3
        for <linux-sunxi@lists.linux.dev>; Fri, 26 Jun 2026 23:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782543307; x=1783148107; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a0YInxvP9vIxrkKOfsq0a9A7RdBzE89fDRN/Cs8YIhM=;
        b=byeFseALngL0Rq0ApvZPHvNG4gEn4+q/eMYnyyKuRWIjMAq20hInw1Q5CJl6EyMm/b
         zfVpWsqQSDzitl/+z1+H0FGIR/yPbxl2SoRi5yUsgYwnziXaIzepuma3uZY6N0CaeDwk
         qqNtGvTbVEIbTI9zBB8MtnExrYFvlw1XQlqTbvrstO7v7sCiI/sXRhnTSCO577e9jCZ1
         ApEXGXYgV7Ih/9nrQDd8MXmDs3MFugMUPqm9P+9DUUrrxT9TLqBjHA9+2EFDqbQ+6Yl6
         iPVjazt6GHz6lMmoZyZl6RHkvhIjXVfo+/ZY6L5VTy2gxBio9PMNVNiG5gx/6htkTUPh
         in8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782543307; x=1783148107;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a0YInxvP9vIxrkKOfsq0a9A7RdBzE89fDRN/Cs8YIhM=;
        b=gtKzzO6GwTUCW0SOBwItb0aHHbUO+jDRlp38N3ygW3P1fbk9oF2KIKwJkKEIDDGrEk
         H0DMKb1/fCBY6vsAgvFU/XMQ3V5AR8pHsqEdb6MmnZPvUnb0RtDacoXWDOKe+4ZbOWME
         JhXDiR46pr6fJjhWvuJ265IJf4aD2RLv/muXwdcS8wB4SmA5cGOZ9g9q0TZs2nlLy7le
         JW3G5obWwPSPFoMbJzLfLY/FLAM3qWXfPxD5WwN3ZU4UzbR8AWAhaUfKEUifyIY4UZaw
         U9fBvGvfYGDGM/uwisLlLmejT2aj7w6oTBi8iadd+nVh9L7xvaZIYEveAKyiioWvZvho
         MAwQ==
X-Forwarded-Encrypted: i=1; AFNElJ9ay/Qjcd/8qi/VuqW4QXYf4TWdyVnvn9irEdrL4RMq7SJLQNc1EKLz1C0Y/aXe4p6VVgSTXQJzJ88Pmw==@lists.linux.dev
X-Gm-Message-State: AOJu0YysS9BP2xBS8qM6wIakjcMU7SxvPD81EUhthat2Zll53PwZWjrG
	zzvaXNNGCSBB1NToC6qZ7g3zWoz0+N6jrMellvHPt0EALptodbuT3sPH
X-Gm-Gg: AfdE7cmDdXgw8MOhUOIRWvxXZJRsBzsE0lXiPhB1MbXtWit3eaY9X2GqgYR8KUjCPM4
	14ortJXutkVu2xjioZd/JPhnvBu/b9zkdmd1WoQmM0Y/kWvjd3Tqu8ESJtYj2QFbvV+IAj052Y1
	UD/Z+WRAD8r0y/J6k2Q2cZ+EZGmwJkjsTDdK75Dm5Bq5XW59QblblIOH8FfHHNHAZgZNAbjWrFl
	VtvsXaOFvEi482Qh0wn+s1H/8/XrFw0zE8tg5JjLmqdSGQeXMM3DjxqWmOQCPnN9VI9rGzTtwlf
	OVB+uQkrDZJCbV0StMcGKuht+BuVc6UJ9YHc/z5WzXPhsVbk0WtvBSJ7mdDzvrW8B/9CBl7KmsM
	jopSy4pmuGsqAaiMXoDASMvu+b56dl6zpCEaPCorSDSXEc7HmVngcgv4JaBk+eN7c2PuFJaIh7j
	oT6tSzQzjWFfn3+aYIf5HZyfrNQb5y4Lldna3AA+bSIcbKejvpD1A66QjhIJ6CWGzK1w==
X-Received: by 2002:a05:600c:4f8f:b0:492:432b:d78b with SMTP id 5b1f17b1804b1-492668710e2mr151774915e9.15.1782543306582;
        Fri, 26 Jun 2026 23:55:06 -0700 (PDT)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4927038578bsm69037185e9.4.2026.06.26.23.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 23:55:06 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Samuel Holland <samuel@sholland.org>, Diogo Silva <diogompaissilva@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Diogo Silva <diogompaissilva@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Remove dependency on DRM simple helpers
Date: Sat, 27 Jun 2026 08:55:04 +0200
Message-ID: <PMdb9FVETQuPUnyh12NM2Q@gmail.com>
In-Reply-To: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
References: <20260623-sun4i_simple-v1-1-fa6696df1fad@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne torek, 23. junij 2026 ob 22:34:40 Srednjeevropski poletni =C4=8Das je D=
iogo Silva napisal(a):
> Simple KMS helper are deprecated since they only add an intermediate
> layer between drivers and the atomic modesetting.
> This patch removes the dependency on drm simple helpers from sun4i
> DRM drivers.
>=20
> Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>

This doesn't look as useful change. Is this tree-wide attempt? If so, it
should be done in one go in one patch series, coordinated with DRM
maintainers.

Best regards,
Jernej


