Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0031014BF87
	for <linux-sunxi@lists.linux.dev>; Mon, 14 Oct 2024 08:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728894741; cv=none; b=YWlCPt5tpgRhuLJfZlTZuEgtYoGauxlkJeZ7cMMjMj2VDf2AmnP8f2xBlNmTt4aPMKvsKCePwpzz9s1WU2PQBQW8ZLjFGI7dZ+AGoAl6UQfagftFVuOqfLxqZnICL6515MdbhWP/Cp/8roy8Voi7fFTjF+j2h1bV5MDtg7Kuo0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728894741; c=relaxed/simple;
	bh=cxIKPl7GKVQn98O/mrnEhVXAkE0uTRhk4Nnr0kHKm+Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/yIW7+VodY13zsZaSOB7Yn/u7XybW2Z5DsdwZ7yIfJ8bS6dQBH0slk0KVo+WuFzA4iE/4cFCNmIcFzqZdesFCuFNnDQovFY3ixDufBR9LX2rhi5u7Bp1OiCjIP13dHa9SqAvXrQHepgdBZUCtlyl+DElR/BTf+SBaEPR0oHeJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZdabUlIj; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZdabUlIj"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539d0929f20so3050415e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 14 Oct 2024 01:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728894738; x=1729499538; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGlKyhbFWxEFs+EN5AdJI/noF1CduIAszsysoTgRVic=;
        b=ZdabUlIj+jOVf0WskwQ52gfEKAQY1yuYBOW31qUJ/rMIhm7L22wB/Js+JqAc9QX8CA
         DSapzqjXTEKIlTQZeMSxTFDaN8raOcqhWaDLC6J0+wYIW5cNn+LZY4DjKsVy1jNYa5Wb
         UPZBXhtwPIoJdeWlh2dQZHPN0Zf4Df704KCCA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728894738; x=1729499538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGlKyhbFWxEFs+EN5AdJI/noF1CduIAszsysoTgRVic=;
        b=hMsZ7U0+dObQerHNSfwcONSxbTdJyZbJ0eeR4Vh4AptBhObVGwW1quDEr6HSEP1Wtr
         Ovq2WsSZIxett12QkFLzWIXJsU4mj1wE2SmRFLT6DLEt2K2BJIUyOs2fOj6fcVL+XbZZ
         4w0Q5uBCWireQqU3FMlOXHhDEe2G07u6sknwK9YIDPlS/Uuw8UBflRaR/+goLkiGY81Y
         SdgKJfncusIKRQHkIg+H/5hCfEh3EXyrt2U7diLJ1hvnQatQLTf++6gTP8Nfe7RZmL7L
         ni69YgkYhwFDS8mv4M3VZOMtodMUvpNqWQ0JU8wZt4eJZ9y/zB2tC18PEkdUgodA27t8
         pgHg==
X-Forwarded-Encrypted: i=1; AJvYcCXwtjiZUOzDYqr2NCAEGsRKSarpScMuSqd4jE+MZekFQvYBnwIQfj0aHpEAvSFi45ZFi9HLiEkyFWqM+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxS0NAQ//cHFpIRBCzYnrLIQIJzMoit0ZFR7BmiWGlZ5pCbOVH
	WrhSyw973UbB/mPbmxULEnAFSeoMr8RS3bSPdwOOcZ771Qyax/zNUlOrCa5NWKTPDFZ7E075q6S
	SXcoNrbo1iq0EYd/QHJTM3MK38Bk5AlFdYxOp
X-Google-Smtp-Source: AGHT+IF8yCwYVSblYBBqvyU6aaOkHAFhmYHymC9/n8uskosKRPRl9o+TsOQe+6xYXWvIN2tZjy8ERc+Cu1NL6JnlR2Y=
X-Received: by 2002:a05:6512:131d:b0:539:a2e0:4e94 with SMTP id
 2adb3069b0e04-539d6ef4d72mr2569999e87.30.1728894738003; Mon, 14 Oct 2024
 01:32:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
In-Reply-To: <20241010-b4-cleanup-h-of-node-put-thermal-v4-0-bfbe29ad81f4@linaro.org>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 14 Oct 2024 16:32:06 +0800
Message-ID: <CAGXv+5FgLQMG=tA6d_gT71j5ZxWPa56rW1UmfUgKot4uCj56+g@mail.gmail.com>
Subject: Re: [PATCH v4 0/6] thermal: scope/cleanup.h improvements
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Amit Kucheria <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Vasily Khoruzhick <anarsoul@gmail.com>, Yangtao Li <tiny.windzz@gmail.com>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, Jonathan Cameron <Jonathan.Cameron@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 11, 2024 at 2:06=E2=80=AFAM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> Changes in v4:
> - Patch 2: rewrite, significant change: kzalloc() also with
>   scoped-handling so the entire error handling could be removed.
>   Due to above, drop review-tags (Chen-Yu, Jonathan).
> - Add Rb tags for other patches.
> - Link to v3: https://lore.kernel.org/r/20241008-b4-cleanup-h-of-node-put=
-thermal-v3-0-825122398f71@linaro.org
>
> Changes in v3:
> - Rebase, because there was bigger rework in thermal code.
>   This made two patches obsolete, but brought new one:
>   1/6: thermal: of: Simplify thermal_of_should_bind with scoped for each =
OF child
> - Link to v2: https://lore.kernel.org/r/20240816-b4-cleanup-h-of-node-put=
-thermal-v2-0-cee9fc490478@linaro.org
>
> Changes in v2:
> - Drop left-over of_node_put in regular exit path (Chen-Yu)
> - Link to v1: https://lore.kernel.org/r/20240814-b4-cleanup-h-of-node-put=
-thermal-v1-0-7a1381e1627e@linaro.org
>
> Few code simplifications with scope/cleanup.h.
>
> Best regards,
> Krzysztof
>
> ---
> Krzysztof Kozlowski (6):
>       thermal: of: Simplify thermal_of_should_bind with scoped for each O=
F child

I couldn't find this in my inbox. But since I already reviewed all the othe=
r
patches, and I looked at this one on lore, consider the whole series is now

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

>       thermal: of: Use scoped memory and OF handling to simplify thermal_=
of_trips_init()
>       thermal: of: Use scoped device node handling to simplify of_thermal=
_zone_find()
>       thermal: qcom-spmi-adc-tm5: Simplify with scoped for each OF child =
loop
>       thermal: tegra: Simplify with scoped for each OF child loop
>       thermal: sun8i: Use scoped device node handling to simplify error p=
aths
>
>  drivers/thermal/qcom/qcom-spmi-adc-tm5.c |  7 ++---
>  drivers/thermal/sun8i_thermal.c          | 11 +++----
>  drivers/thermal/tegra/soctherm.c         |  5 ++-
>  drivers/thermal/thermal_of.c             | 54 ++++++++++----------------=
------
>  4 files changed, 25 insertions(+), 52 deletions(-)
> ---
> base-commit: 33ce24234fca4c083e6685a18b460a18ebb5d5c1
> change-id: 20240814-b4-cleanup-h-of-node-put-thermal-2268440cc6f7
>
> Best regards,
> --
> Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>
