Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52F04274658
	for <linux-sunxi@lists.linux.dev>; Mon,  3 Aug 2026 14:29:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785767400; cv=none; b=UwczTZNwsfis7ywuwhJQ8e+aZSyclTv+/QvoX6NIt1ZtYkEXr/kc7Zo/44oGwjkgtzeghrpLqtpGBdliQCUPJWi8UYzGsUBBA1LyobkvJJ3UzIUcNTTRok2ra3fasHOh9pAnx+EYO6HRGuyGzd++vXfie5s56/Iti4SWFZ5248A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785767400; c=relaxed/simple;
	bh=ULsy1ctbWqO6V2elk1FWgzGLxyQfY/VXo4lHMIY/JzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iKXgDTtD3RzXtZJZzmJR/bMkJA9XiHwAcOK9iLkGXtKzDPLhKNfXPKD6Tfnz3g9QXfXgM0sVmIdzZQdFvARzcVEtcOKTwVxS4UR6w1kb3APoqFwwPJpQcXHmdy4jhZRGk4l2TwG44W2I48Uvykp81u5wG1tdxoxqxGLPKKPI2i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+6QgAor; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+6QgAor"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6a10d02ff43so851839a12.0
        for <linux-sunxi@lists.linux.dev>; Mon, 03 Aug 2026 07:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785767398; x=1786372198; darn=lists.linux.dev;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ULsy1ctbWqO6V2elk1FWgzGLxyQfY/VXo4lHMIY/JzI=;
        b=R+6QgAor4Bxkm/aBxf/ydRTsHxyTRswmsM0BZNlvZdaKb+L4p/nbYI2YcAVUXagsvr
         cMBoyI4TRzeL3Na8DBc2fGHYZZNAsANKtXtCQRGePY9gh3HdIAp25zwudvRaRSZdEtOc
         +UX4yOQ35fDn2XfYSFIfICnNZXHlUP/y8wED8dqK+vq/OsZdsrPch05hhmTSIzUWr9sv
         WjT3+ZME4ncfcrj0X7hLTthScbeOkBjUbuG4uAGQgTlaUFIxuWMN30ShUQCTNZTugj4N
         7PtxRMUwVf2posLNLpnvdLXuKFlkjbcidr8Rw+T/j1JU2aSYLDaPR0QF8aDmx5vmmals
         GVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785767398; x=1786372198;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ULsy1ctbWqO6V2elk1FWgzGLxyQfY/VXo4lHMIY/JzI=;
        b=quL0nL5NFFzo2SvWJMCdzS1untZO0m2roP26PcV4OepslHQM7gOfE/FwTExhe7fIAv
         ydks5ihucwNmuPLPrZvqWzN9Ml1IpF9nz9b7TR6XH+T+bvhVBD5eBKZMOA5+B2P06GUH
         XWX8Q6D/IHui0ux4JzXks+gtzuc8g5BKMMGPqgAYL4+0zgOD8uiaEf5tPXxvQ2LOkf2d
         iQf/ZTYh4N6dmvUgUlZ/FbiK8qM70cCNHutLhlFP3TVY4iVHiS3/nq7M4Ns7Sdc96g/e
         T2ue3iSEWXGaxfggcVQUqWm9ChxOQ/LN3BnV/sZeB0vub4VN+fBtFotCN+1tq09v4Kco
         q9wQ==
X-Forwarded-Encrypted: i=1; AHgh+RoSgBIIMrVGuN6Iu7R2Yo4u+r/NDfyPweHaU5uFukJgwtAWjeJ+huolLIXzZPlT4JDkrWwKz7MgYVSGXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwL+Dtxw/XCUAacqH3Cowe9j3Cnbho4YV/POd1W7uWi1ANzlBMR
	c06WpR0aRFOZAsJ0yDPnkjwGOjYL03Wz0YXdShCh+eJt+p7uKb91RB6q
X-Gm-Gg: AR+sD10qg7iMTBZFtxZZ8xkoMe0OIWPEXCzRw2VdE/U0zFmnoHX4U4ffH4a2dBQn+iy
	Cl7Pa2Ab2hC82YyI+G6c7mqwPE8s02vqRj+ZQR2cqTVaJoaIlfrof9cYb8kG2avnHbKlHG0VdcQ
	83qViu9V3iSW3KqcavLKoqQz4Ewh9rKPelOr+uXpy2JgVsi0LixMuU9a9M5/eO7+lTSa/0Rxp5/
	xXecvLxPDvueiahlVo++cwwJCtudOXH0Ec8eIKD1mf2NgjVsbUUHZFDAArCF4nxErm2tQufgtBu
	x8SlUCwH9taqwpdIEHk97iUXBqfYO6jDuYKP72UYWwxkJY+tWg68lNFMRIdnB8bzD5F0m+1xbzQ
	68YnPDd/9Ho0ZvB3OmmEO9e30pnB7EIV0ckK+bIROzL/rujIjR+63ZnhfBUI2yY4E4UjA26Ntj4
	GN+NWtf91MVTUo89ihfy07/i0sNlpksi6YG/P4NUMBsuqLmn85JL8bMT2MsFywPIBAkfOILILW2
	SbQWvlY+H/kYtfUTXfqLgDNnoPCHSL2CMqVbbhr/WQffJ0mUNI1XV7WaZ53vdeZxCerR55zah/X
	aZZ6yamXvLu4CiFp7GtV7K1pbOLuIXG5R3duCHrtGLjnVOID/8W+fsyTCh1AwzWhhoRRvXa4uNS
	DYUyVZ2KlzdTcChP0f3dfDDcVOTox/RYAYqX9mSr3I2Xpr7K0ECw9XGNnqLb/eI0ChZpxgvFMfm
	jyDioIEss=
X-Received: by 2002:a05:6402:21ca:b0:698:c13e:179a with SMTP id 4fb4d7f45d1cf-6a0a7c72678mr7302242a12.10.1785767397382;
        Mon, 03 Aug 2026 07:29:57 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-68.dynamic.telemach.net. [86.58.6.68])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a09c63dca6sm5741293a12.16.2026.08.03.07.29.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 07:29:56 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Chen-Yu Tsai <wenst@chromium.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>, linux-sunxi@lists.linux.dev,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/sun4i: framebuffer: Set mode_config.normalize_zpos
Date: Mon, 03 Aug 2026 16:29:53 +0200
Message-ID: <lyqNcSMNQtSAKCGG4XMGOg@gmail.com>
In-Reply-To: <20260803111319.2836240-1-wenst@chromium.org>
References: <20260803111319.2836240-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 3. avgust 2026 ob 13:13:18 Srednjeevropski poletni =C4=8Das=
 je Chen-Yu Tsai napisal(a):
> Back when support for zpos was added in commit 47a05f4a68f9 ("drm/sun4i:
> backend: Add support for zpos"), a custom atomic_check callback was also
> added in commit b8f1230dd3bf ("drm/sun4i: framebuffer: Add a custom
> atomic_check") to have a place to call drm_atomic_normalize_zpos().
>=20
> Commit 49efffc7fbd4 ("drm: Add drm_mode_config->normalize_zpos boolean")
> added drm_atomic_normalize_zpos() to the standard atomic_check function.
>=20
> Set mode_config.normalize_zpos and drop the custom atomic_check
> implementation, which at this point is just a simplified copy of the
> standard one. The standard one also checks whether async updates are
> valid and updates the self refresh state, but neither feature is
> supported by this driver.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


