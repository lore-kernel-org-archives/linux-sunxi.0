Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D75D305692
	for <linux-sunxi@lists.linux.dev>; Thu,  6 Aug 2026 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785997390; cv=none; b=EkIvrweUI9XCCbOzeLbzPk9O7gebJlOUQqMEZFFfjI4mmg37hE+ho3fLbJ/rLzItgwshmYQDIlH7b6G7xFhawHNjIhPyc69HKd0H+e6SPUJYneId8iztl7dVthVnQnPfGPRUmJj18UZZcy/sChsSRI6YW6wEIyPnr4rdHYdphgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785997390; c=relaxed/simple;
	bh=xh6fW3YCwCdICy4Uv554XUpr3lVLEPibEXhGMVL8OdU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=TUM+pPt+HgFJ9fibrRyuKpZGcOsHj2sH5ug+/s0i1jLFd9rnko/xRPPaFyVlajCzq8poHPyi+exDZEukIVd4CnuT/b8FngR8B/7slbkmxE+pOV2lSdjkJOfDyDNenGRsAw4XRd2p1D1XkbIofgw+IsURqIpK1xNA0G/lqPF9hlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=UW96okVl; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="UW96okVl"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c9fe3c9bd5fso446854a12.0
        for <linux-sunxi@lists.linux.dev>; Wed, 05 Aug 2026 23:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785997388; x=1786602188; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7Z89kXcdp+v6CMSCH4P4EBLtkPOyVSNFrnKEqAKEPmw=;
        b=UW96okVlSaXgRRehD8g+BF3b9GCvyg6FrfIotIpNzbMH86JBQfk02dnqsJLcXZnltL
         m8oGnHA504VpjwkC9K0N1oSRuc2v8L136Tw9vhnVvruW700ncCHAalxAC94Ma+Cjh/Y5
         Ah8Akj1U0wfbOTKB2IrXpVReXgg3Hp4W1hvjM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785997388; x=1786602188;
        h=content-transfer-encoding:content-type:mime-version:date:message-id
         :subject:references:in-reply-to:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Z89kXcdp+v6CMSCH4P4EBLtkPOyVSNFrnKEqAKEPmw=;
        b=Gx94rLWf74jymVgbxnnPUlXUgiqKVJIRI5mP+bimpFvRzlhmehY0sBPpXt0W184xoU
         ItzOnDUvYdHERhMZ953UQrQ1DdzN9JIWegjeBGXSGOduaHSP0rD3CtfccMkkcf8iPVfz
         EcltNcGNlIu9n6cf3uevFMVKwu5DWA+qK3kYc8+4Tn3D556OlhMd6jCD+ci4q1x1wtFP
         cFJOnsiUsqv0u2MnKNgI1unU0/S1Nxm9p/BzPx8o6PNC3NUVMt5VpFUHpqszOjGVRemV
         XzV7MVD144AcQ9sBKms/1rcA/AUsJxsdujFB0BBVNQSXo06IVOY/3v7B5+P5G5bzn44c
         7Lmg==
X-Gm-Message-State: AOJu0Yz7IA+xljUJdAHWIE1KhQn13g0URqdTBOSdG22o1ttsqzY1Qc+f
	W6XxBrV2Ou8EMp55k+3LnTR0jCznQEm1jfoCHo3v1tEO3SjPGtP3fFvLcrG/vseTMyWMObmze5E
	XctrDgg==
X-Gm-Gg: AR+sD13uZO18ooe5MlqhR4rBh8NV/N6SIUda6DnGsJ3HCZMLjvlvqoLhUN3vdjH43gB
	l87F3v87MP5p542Z2r8Han4zUqwQ8zesMCx6GU3oRg8OYiHfkI9rWSqFXxOWvsYUbdOTlmNNVYA
	vvg2KRsocqxjhtZEgCtatmrc4DTpKg4a8LVmZvLo4iawKZLXZqWP7AyZEzNscJenj5Dse16q22G
	qGP00c0I5EKiqzk+Y0qWOqFY00Zzpg3UXCSk/LtQDUhH5Uj8sIa1MjkWrQ6dHwUSOOS/CQDvKzA
	blYd3V+VqCtw93A9bTxbU8IYtrmUy9kmDR8FgJDNQRG+TOmNW7brpncMqSQLGxQDDYdxP4lVuOU
	EWBlzX5fzImrWtVi83ZdhRtkcEUjLqsSL7Kl0VvZQsBiMVIZ3uIKIu9VrzEYxe9oIrCvVTrgETa
	Frh8xbeoXFjAsan9D4GSPL6WtSD6i1CnHr5oyySWwoVFocLUkSagW8d+rv8o7FWsE4/tnAkl5vb
	+v+LuItJUWPiP0/UZUq4sDGL8a8yDWfZjLjp+ox7F0UyqnrybXI+69M
X-Received: by 2002:a05:6a20:9144:b0:3bf:78a1:c140 with SMTP id adf61e73a8af0-3cba2a3f7d1mr1941065637.7.1785997388510;
        Wed, 05 Aug 2026 23:23:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:fdd0:1bd2:431f:2014])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe707eaf1bsm2529941a12.11.2026.08.05.23.23.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 23:23:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: linux-sunxi@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260803111319.2836240-1-wenst@chromium.org>
References: <20260803111319.2836240-1-wenst@chromium.org>
Subject: Re: [PATCH] drm/sun4i: framebuffer: Set mode_config.normalize_zpos
Message-Id: <178599738411.149139.6199626642838531611.b4-ty@chromium.org>
Date: Thu, 06 Aug 2026 14:23:04 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Mon, 03 Aug 2026 19:13:18 +0800, Chen-Yu Tsai wrote:
> Back when support for zpos was added in commit 47a05f4a68f9 ("drm/sun4i:
> backend: Add support for zpos"), a custom atomic_check callback was also
> added in commit b8f1230dd3bf ("drm/sun4i: framebuffer: Add a custom
> atomic_check") to have a place to call drm_atomic_normalize_zpos().
> 
> Commit 49efffc7fbd4 ("drm: Add drm_mode_config->normalize_zpos boolean")
> added drm_atomic_normalize_zpos() to the standard atomic_check function.
> 
> [...]

Applied to drm-misc-next in drm-misc, thanks!

[1/1] drm/sun4i: framebuffer: Set mode_config.normalize_zpos
      commit: 2d5e8c2167ab7af17535cd7a6f5bda995e85c7b2

Best regards,
-- 
Chen-Yu Tsai <wenst@chromium.org>

