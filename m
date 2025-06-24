Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D19F246BD5
	for <linux-sunxi@lists.linux.dev>; Tue, 24 Jun 2025 19:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750792387; cv=none; b=A2MHeASgxixo6XPwjL0axCCkKqfFM0PKmSx6dG1rZgcJqfexfk3rKDdUalr63iBiaz2fyPJXjPl8QN4QWlBjTwO0VRYYzQ3PW4n5MOiaifr5kkxb74OL1vzqJPrHZydGDXYIk3xxhTXqxg3/i8//MI72FZwfiEZFI/SuBeKIO+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750792387; c=relaxed/simple;
	bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KXjW5CWHb2z9R7inACJ0qVYehQi1QOrSEK/od/yJvr9YCvlT8AlgyI//vTRSjp3VFB/1CUbbH/4InyRTVfNPmkZzX/BY0lUQ7CGYsHf9OzQ0OtujvEZdySvp+RrKn1t1GMp74WWjLhFDp0m8fvPUtGns3jIqEMuCPwXS+y7FQHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Y2V3dMT3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Y2V3dMT3"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso1016517e87.1
        for <linux-sunxi@lists.linux.dev>; Tue, 24 Jun 2025 12:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750792382; x=1751397182; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
        b=Y2V3dMT3LDuzgjQnfHumlSE2frjMmLr2UXndQi/gbnGh85p/+zm5ILkmzwvP9+NE+f
         aBlAz9Y2tkn7M/1wkXVD0iF3wgZQKRO4ss6fSdc6FyldejPeAXdtjt01sYwfOSOsM9rL
         HC+XUmnK5UKkdAOjxv3ukLZcfOUGszdjHW6vhB2tx8c+qgeE6ahBissKgklcW1gtCoiN
         pOanyktI0z9eR7u5OPJJSRPQCFHk7at/xUP6dzmA5Z666gIZ3vIofpsE/C4bVeIGfeez
         aelbPvImggqAcuu5JikC+hTKKKY2sMppCjT3spaAuIOmFtMjKPKwDgxhc3ebUhBH4MdO
         mqdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750792382; x=1751397182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=42g0mLF/csycd0PbqCpM2WtITkGugXfu8fIaTZhFhBc=;
        b=GqnV+M29pMNuG27PnHLub/JnJeKRS5Yf6Ore9WMJj40o6HpulkDeRQHhplk/ca/hhZ
         VP6LrsV+BZx0V55ROlLZpRaV1Z3kDzAMKhE5SEjZX+monOh95lI7ECNXLJlbnxOEiOUd
         wNWVUfcGNm/O5tNuRtgc26dMd0EWHu+Pph7xna7tJ5aLtdqHq3ENItwh6KEtq4B9ylyE
         qJXRB0Opq/01JleFnLI2gjdPHIRNxvEb9oAcYZwLnVfFU9dGa1CGxF+ejfVR2sWqvaSl
         ofu3EpjFpYfomTvSmea//mHW8NAjIG+z5H5Om7HbsrIa75tdqMQyy3G5eoYQ3BapdTNA
         2BPQ==
X-Forwarded-Encrypted: i=1; AJvYcCXZGtOfG5/dzODSv8nX5nlPg8EZd8nNj+CfldfP7hBl2xOCT1hBoAd0lTkm7l/jEUY/CKz5tUUcglBBnQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGjDRuiC9jY2kpi4JLe/p+YKtsSB4cZlpm+OODsfGdlU1pjDPW
	DmMWrKiTWrAOFgV321tbXpkQyr2psD/bxv9+hhn68bPDIgkDUyYU+egw3yixUeRSE8JQ8SyeP17
	cA5BhL+R/apUMQ00Y9XVXDjyAWUI0s49wBIgIaz6ykg==
X-Gm-Gg: ASbGncvS0pjbvGtNOrZ4kQR6tfFE2+SPzD4JUCNxtOylRn7LnYQw/SzwTESO2Ku02fd
	MJSFTSlZVc+zfnMpZOrehIHj1V7gmYPBo/gsi09jAkFD1aqgjsNA/ry1HZ+kXv8nvm+bBylRA0v
	wV439xSZLkwmgoDKyo316Cu0jhqHyLQwzRNWHaNfr95Cs=
X-Google-Smtp-Source: AGHT+IFcvsv4Jx0wPVU5q9HdOKD/NjVsRLZ8GzOGiSq6bCzhKJUr6IeEsytMxz0Nq3UnxW9fjOmi1xt9+Qqg6x/9RLE=
X-Received: by 2002:a05:6512:1247:b0:553:35ad:2f45 with SMTP id
 2adb3069b0e04-554fdf7c090mr5733e87.50.1750792382134; Tue, 24 Jun 2025
 12:13:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250619-b4-of_drm_find_panel_part1-v2-0-0df94aecc43d@redhat.com> <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
In-Reply-To: <20250619-b4-of_drm_find_panel_part1-v2-14-0df94aecc43d@redhat.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 24 Jun 2025 21:12:50 +0200
X-Gm-Features: AX0GCFsyGEH8PEzLkMow539_Cj69jbmDRSN9FsVHKoXlbloZW-99abb_OrCBGA0
Message-ID: <CACRpkdZM75HEZ0DACqC3iY7S1gLurw29Z--C7TJxUVxPUTuNqA@mail.gmail.com>
Subject: Re: [PATCH v2 14/16] drm/mcde: Keep up with refcounting
To: Anusha Srivatsa <asrivats@redhat.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Samuel Holland <samuel@sholland.org>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Alain Volmat <alain.volmat@foss.st.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Stefan Agner <stefan@agner.ch>, 
	Alison Wang <alison.wang@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-samsung-soc@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2025 at 9:19=E2=80=AFPM Anusha Srivatsa <asrivats@redhat.co=
m> wrote:

> Put the panel reference returned by of_drm_find_panel()
> back when driver is no longer using it.
>
> Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
