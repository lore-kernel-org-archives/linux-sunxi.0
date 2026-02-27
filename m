Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1B233644DE
	for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 18:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772215278; cv=none; b=GdGaV0vGnIH/K+B9bGy7SsSLG0y/VzDOn9ZgRofgk+pv4Ch5m+KdTlDx7UfKpGEyxekKqSV+7ymvpF3P9AXVpzHNFbD758rF/aveyR8UAKSKNq1DLozDdzTNLxaUmOjW0cBoFTag09VN8Ub/JwAwXtUtNPz7yXz61vhSFZMzVxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772215278; c=relaxed/simple;
	bh=1Ul0Dd4P/vtKDgVC2VSwGduPgnL+oOjNMm7CLdGIWwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LfNuEVyVnavsAp7FbPB38ZIHBrmpAXbbU2Z5vZIdhg4hBJ4R1YfDEUSILPoBV6NTbWG8C9cFZGVsIVw562JSMT7ILWC9s5YhmTaINSv2RGeb4pCuSIeU/vWghJHu+UNEzTCZ8QwkUIE80pUtJje0PMapfPPafdtBV5Qsn8PlFco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FlrBpK4X; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FlrBpK4X"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-48375f1defeso16855965e9.0
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772215275; x=1772820075; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Ul0Dd4P/vtKDgVC2VSwGduPgnL+oOjNMm7CLdGIWwA=;
        b=FlrBpK4X3K0Z+gQfTTmADJ+mRONvtNvShLIR3lES6OKpOsPTuH13Hn1BJJowYd+3EV
         pxgzZA6xBpnRAVPl4/Im22kUSow2zMtxvUQXTBIhqPk23Z3sR1HCev9QRMFrMAkUIW+J
         vQJFVh0IC3blKJGLHkksK13pt8C2ZewC6dEMApvHL4A1bWhrQJhHc2uNQ2ZmbpIaohql
         MYRwpMiQUacl4VTjk40zlsktRlDFu0j2vE7qDRKmRzFbBdTe8IG/BrzyMDYFH0hg7+ty
         x/hDPTYp5bz/PyBprZC1VpZqphfJ1yDBjCe7b8EO69/Nzz1IBF7ZFxlc8Z5bv6zcFLpb
         +YoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772215275; x=1772820075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1Ul0Dd4P/vtKDgVC2VSwGduPgnL+oOjNMm7CLdGIWwA=;
        b=iMBOpTNd/Yg3SnL36SDWcnNKvHC04ZY2vqssJ/lY6ResRFguYoimvpQsS/uzH0ddxK
         xNAQY/mEXO2cyCRxoVzlwtFmOGmM/OYMi11Hb/g/52Kt5xpJXREHgPnpZuQ2q7ZcjB4o
         9xSe6CYCr4FstKjHs7AJY5DmEiEl16DvT7AhmIBQYB4zzWz7a1vp1LGmzwOUHn16E4dj
         AF38FCKM4PQ2LLXPBEdaORTX+8OnTOPJKqloUMgdrNw7nZzlntH5J+WkH/eXREwyKjkC
         9g+sIFR3GNpzqgi+ftxjk6CrmqNdWvRcXvApcklQs4Sd2bvyiro005fOXdcO/HB9ue/p
         Qagw==
X-Forwarded-Encrypted: i=1; AJvYcCX5f5e1ZWKAHewdoughvaxDuB9AWJtF2N4RjbWpBqsGvQBd9SxqJ3Tv0RaUS7W9k5KngIUDvdONGhG0rg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/kUQhzxWrDOa+bVGlvMUcuXRd3r3y3ZRi5iT7YVBN1U5Imk7E
	83jMQmAAFlIRXYMZIf0ta+GzOsYlb7jga84fXeANZSQRtXFy3m0hqcBC
X-Gm-Gg: ATEYQzwe6G2p1YOTXaCYxTGVr5E4Lkcf/68DD+WRBDqFdUutoZ8+uAZsDkY1u9l+eAV
	GGNArSRjz4ovOLpUM3HNP+vFjSEdinZxgNqAVVBhXFPjP31RJ9Ouvjr90zDZNxH9zmYfsb7eHNu
	AujjUqfU2BfF+fwOsbRr7tNt5zbA9zcFr+m+dwGeHSUhftsY9Tbki4xlD5MP21I4r3q4pb6xbjo
	xlc5Zk+Fvo7sVcFsoCbMHkH8RU+o1ZdmipMFNlII2OqM3YhjTMqIA2Oz+fyY7y7LY4A93VQPvAn
	3mRA/Ch7Q2vKVJ91XPAXVrtsw2N7/xkD2mvkSEpitcDwm6QjJ2buH9zkuuqg9Lqqa9Vp91vRmwk
	N5ebAJBZV8h+YhN/VskhyO+F3KO7qU8zn9zZkPiPbIDhl67GTcC9bj2Jsdln6Hrxoq11a9n02kD
	/mlKFF60/bb0ZGA9smDnTZlPdGN39+ThTEww/dHtLcPIGP
X-Received: by 2002:a05:6000:40c9:b0:439:8c1c:6b4 with SMTP id ffacd0b85a97d-4399de2cbafmr6732890f8f.53.1772215275081;
        Fri, 27 Feb 2026 10:01:15 -0800 (PST)
Received: from jernej-laptop.localnet ([188.159.248.16])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c70ff6esm13018886f8f.12.2026.02.27.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 10:01:14 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: wens@kernel.org, mripard@kernel.org, samuel@sholland.org,
 Ethan Tidmore <ethantidmore06@gmail.com>
Cc: maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Ethan Tidmore <ethantidmore06@gmail.com>
Subject: Re: [PATCH] drm/sun4i: Fix resource leaks
Date: Fri, 27 Feb 2026 19:01:12 +0100
Message-ID: <2819144.mvXUDI8C0e@jernej-laptop>
In-Reply-To: <20260226163836.10335-1-ethantidmore06@gmail.com>
References: <20260226163836.10335-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne =C4=8Detrtek, 26. februar 2026 ob 17:38:36 Srednjeevropski standardni =
=C4=8Das je Ethan Tidmore napisal(a):
> Three clocks are not being released in devm_regmap_init_mmio() error
> path.
>=20
> Add proper goto and set ret to the error code.
>=20
> Fixes: 8270249fbeaf0 ("drm/sun4i: backend: Create regmap after access is =
possible")
> Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


