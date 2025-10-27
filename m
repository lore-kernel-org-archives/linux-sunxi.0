Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B0A62D3A94
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 16:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761583769; cv=none; b=D+dFQkMX6aNOiVR8DY4XkZ4jDmEcJnmqBKmegba8GNesINdULAsfGv1qkezkcRSjivf7CJKakGE7NFbImwr0Ey8gtDGMuhkC47H7prU+TBlM6hMczZ9U18ULsyukIp0FhOzbi3LLqtm7sy/bbq8+xUArmrA6tRK8vUBuQchSbMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761583769; c=relaxed/simple;
	bh=iwt0jedyUiNOzFlobqK/cAcMQOp8Zb3j6L3DOCL3MJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E7AosSs+bAeZjuj8BYKyLwgRV5HFpyq1A3enwnH7Z6W/dlnwNjY4P4mmxx7Xayz+wLh/Bt2O1rVvkIGix/CEAjfPf/I7yPR+W6xlGy6ZXK/5mYmRPDMWgnDJAnGLQ8RurWLfTIfqrym9rVpAaLEqDc4PxfRdWHrDvcRMinLxvNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=spnCglXj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="spnCglXj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FD1CC4AF0C
	for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 16:49:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761583768;
	bh=iwt0jedyUiNOzFlobqK/cAcMQOp8Zb3j6L3DOCL3MJ8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc:From;
	b=spnCglXjZvgKfzL4Yh67/LPtpXbNsmmsvIcdUaJEmXTVIRDxkkjn3AcLZF99Rkgam
	 MZYOPgkn69POki8jL61AtdMxSHXSM5xee+poAVTOfHf7uZ511JYHDwHdRUOeXMrU6J
	 +MjQ1Uwx/xShff8Ug9Zs/gYeLi4bvVK3enujeE1aAMdNQahL+sVavlb3ln0Itqwilo
	 vMgAviDAsUmWDvn3TewOKtFgiAJcFx18ojQacW3Q3QmhWsadDK7CowbcS4/3DjxARg
	 navc+Z46aTu0M918PiHTPlfTsMSGoYeisIs2Hw7lz3hGuuP0b/kbmtRnNg2fs8Zkas
	 OUBM9tuP0oTsw==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-58d29830058so5647462e87.0
        for <linux-sunxi@lists.linux.dev>; Mon, 27 Oct 2025 09:49:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUhMJ/d9VGXIOT67hax4liFQtU2ToH/1kyIqMpO8b3xWwzHs0kKSmpgsldhqfJF91Kr7qr021Nymn6T9A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzmRUCQ6NMm6RENfh2YqBRZNTuaHV0Tzpr4/ImZd21C8c2sHrM3
	G/B6MLrXhra3DnqwK9fcNneOtUGeLuWgaE0t58mqcRtXxrCUTjoa2TjRb0c1hDEW/wZ0vbP59Wk
	V7j5/1ypxPyR7hGBHRkNG3/UxfiwZd70=
X-Google-Smtp-Source: AGHT+IGjZBPVCroqeihNgSQn8QEjwNnQ2fNEMf1WNTWh/VQEvPpTrq85cH+GmAxeA1rjsw+++pJ4KpH26mh31O7ZNf0=
X-Received: by 2002:a2e:a902:0:b0:364:f830:230b with SMTP id
 38308e7fff4ca-379076f696bmr1122261fa.22.1761583766949; Mon, 27 Oct 2025
 09:49:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-12-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-12-jernej.skrabec@gmail.com>
Reply-To: wens@kernel.org
From: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 28 Oct 2025 00:49:13 +0800
X-Gmail-Original-Message-ID: <CAGb2v66f0s0n4cv7M6_DXF6cxnzjd=9jRuCk-o-=rVV+6OZLqw@mail.gmail.com>
X-Gm-Features: AWmQ_bm0ycd464KA4-SLL89Dthjko7sDvbYHRomqDxy1qMNmkmTwAyRYJbT_EzA
Message-ID: <CAGb2v66f0s0n4cv7M6_DXF6cxnzjd=9jRuCk-o-=rVV+6OZLqw@mail.gmail.com>
Subject: Re: [PATCH 11/30] drm/sun4i: de2/de3: Simplify CSC config interface
To: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de, 
	airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org, 
	dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 3:23=E2=80=AFAM Jernej Skrabec <jernej.skrabec@gmai=
l.com> wrote:
>
> Merging both function into one lets this one decide on it's own if CSC
> should be enabled or not. Currently heuristics for that is pretty simple
> - enable it for YUV formats and disable for RGB. DE3 and newer allows
> YUV pipeline, which will be easier to implement these way.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
