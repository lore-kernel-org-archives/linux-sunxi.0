Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76EA32C30A
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 17:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760980054; cv=none; b=bw2hjSmof2IXLsVTmpkA3+AGoDKm/kS5DzIAz+DXtIalujjA1DzgIh1/sax267EoWD4VxYgz0/zoG4nAEvbGq/ca0PAIabByLkPnLvd/6RrXRX6NyH2+CBRkCSEoOOun8PFCVQiOpL6iK3ek+yqjJRwgQyIHs/32QKwTjsS2ZfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760980054; c=relaxed/simple;
	bh=9640FzO+7LwBWDEDlYQ6XFq5rpeqGgD5bICG4rK6d/M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PU0h/fHgkqpgAwVzk/JUQzGO5PMcmV0M2/RPjpqfqn0LiLgyiK9vsYHxjqKblgzeyIvkYXgLgeifNlx+HD/R/CivkNxOeDlWdkNbriQCbbYwDSZ3GCJbE+mr6MNEkOVxI5Smtxs0X+LbNjGi0iDgPEDhtG31acZCtAIPfjvdZ1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9+P30XV; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9+P30XV"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-46b303f7469so36415105e9.1
        for <linux-sunxi@lists.linux.dev>; Mon, 20 Oct 2025 10:07:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760980051; x=1761584851; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9640FzO+7LwBWDEDlYQ6XFq5rpeqGgD5bICG4rK6d/M=;
        b=Y9+P30XV6Dhe13vlAxHuwqEvqEJO1snpsR4hGAgWgrZqIFvkuFliNbLvI39R/gW1Vd
         e5wmyYGiObu15YMYZXGShtuc39E7rwRKFvkeedvSdDipmDIeBOx6APLDCt6r0d4nuY9R
         gtum/73NtnQIPl/awGi4MtZFtcdPYpPaCfEuPIkR1tCPGhEdMVOUGWyRui/ltD6fz6j9
         NdIAlFU1BiR5bKcq7WR7GkZk05Uyt1oDswSvc0F/TPqU20mzd50ydNA6cex0loVheXjk
         hSrkN8zOQ4Hr0FBcjhptJ3dqaurk3obOWenekvexUZxKLYVivjv41S95BwlIktw4fzIg
         eIWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760980051; x=1761584851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9640FzO+7LwBWDEDlYQ6XFq5rpeqGgD5bICG4rK6d/M=;
        b=ikssDDedel75svKlZlMVHKK0IvMW2sdG4nmeSuM0qMJkDQMXawuURUcBY0DvF+VKqx
         FB4gpwQG/SMmaZJYPE6yIVkPdC47eQuPRBIWgA85p9JkIYE21z5PjPeFbIH2N+RZSXW7
         d3hMRSghbkbKhlnnXN47fasuxFCwV2Y6zV0o0luLrwYN873dTLYuVqwR0AYsYkBb86g2
         ImhnCFaDpj2+IYL8Gz1pfJbuucK/m9ZspgMYKWsBlxSxzNQZC4SYMNCaMOGIb4xK/r5Q
         WODVtgJ8Myb2vTa49CShOnh1j5r7khK1mnctdrNmkC2tDjl0da+PIB/FZo7XR3xqyHp4
         JuQQ==
X-Gm-Message-State: AOJu0YzfvtbEXUwGXvQH4D6GvLjuVJibz4Cj8FIAiZy9zNoiUwOo9pGH
	ewiQEDqO+yWMWjlXoqSiBZ8Hc4D1MCD3HijM+k2RxnWZ/hO03dd5YHMb
X-Gm-Gg: ASbGncsEAHg4NOk01k8s1h6khcY0/309MP/ns2N5K3N40LsrrN2ZwMLgMlm3CC29ozH
	fbG6M3jovK9gCinKL5abFViRW0r4kDwzlgcDLUAqfa9JrAFAQaojhZoX/Oqr+DJpcEHWzkIfZoN
	Y+sh6XWDzprGn5jcqHjoYxWsDG/4INzi9ms89hnkf+wlZn0UDLHSk9vihzihZZI8FFffNHudQ1+
	QDLDmNui6LDznuJuMnkRhRQKqTpXz8HBVdS1bC8uI1rpR9bjksnAUEbrqmKCbDpP4p1Fz/GOe52
	LSRN29Fr4CNKCCAa90rrDo1zZ1nm2ZzVA+L/ed0LqqnKs9TiemsALDzO+A+qH8Dpt0EQK0s1Ndq
	DuL417zaNHpD/m8V4ag7Uo8nhsWnCy4NJzX7gGWmLEaa30RZWAiKYxzxbg0yolk5MmWkPvA9uEu
	VBqhx24QypFv9NSxIHmmxE7OODrTVR5F/Xo3er+Qw2Lc9pBBUOUX0so46XTYBGfPTfvkt+
X-Google-Smtp-Source: AGHT+IF71H05NxO/mN75w8LXTuLNlvDg53UBaWFoqKaZMqlp8yMREG6PcbIoHKXwfd7uM03lA2vPNA==
X-Received: by 2002:a05:600c:524f:b0:471:115e:624f with SMTP id 5b1f17b1804b1-4711790c2d6mr98843065e9.21.1760980050861;
        Mon, 20 Oct 2025 10:07:30 -0700 (PDT)
Received: from jernej-laptop.localnet (178-79-73-218.dynamic.telemach.net. [178.79.73.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144b5c34sm252921305e9.10.2025.10.20.10.07.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 10:07:30 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej@kernel.org>,
 Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 dmaengine@vger.kernel.org
Subject:
 Re: [PATCH] dmaengine: sun6i: Add debug messages for cyclic DMA prepare
Date: Mon, 20 Oct 2025 19:07:29 +0200
Message-ID: <1934468.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20251020170147.2783867-1-wens@kernel.org>
References: <20251020170147.2783867-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne ponedeljek, 20. oktober 2025 ob 19:01:45 Srednjeevropski poletni =C4=8D=
as je Chen-Yu Tsai napisal(a):
> The driver already has debug messages for memcpy and linear transfers,
> but is missing them for cyclic transfers.
>=20
> Cyclic transfers are one of the main uses of the DMA controller, used
> for audio data transfers. And since these are likely the first DMA
> peripherals to be enabled, it helps to have these debug messages.
>=20
> Signed-off-by: Chen-Yu Tsai <wens@kernel.org>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


