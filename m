Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0F8126F295
	for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 08:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760863905; cv=none; b=icI/rADA//QgPg+x3SQmenPUKpG7nAQQgLv5q9ZnmzTToRqhr49dxZc132pZcNPfTDlGvGqiLMd3iu2B/FMLQZviJ2Sw+io9HTyeVAR4vja21TDJLadVoD+gcOa1WLBf6OFB3votGifRQiUFrzo7XkL6pjMjIk7mFMEAkWcEHog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760863905; c=relaxed/simple;
	bh=XqqRnamX48XVhgy/cSJowCbYmZ8Q51GIp96qBAj+mSU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSeklayiOAGUi+xP9z8kGVKr2IyCvMLSECjUrjhWStbt+3kzI0cAX5nxgnbzY/TQtss2x2XifJHHrXDfVNazP2PErc7pBDCpbWT+QdLe94UU0lytUYELyC7LTr81BHEaYy6oSFvUTOmwS1u6WwyLG+NCo7vujpIMzyo5/ip1md0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-57d8ff3944dso3913920e87.3
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 01:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760863898; x=1761468698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XqqRnamX48XVhgy/cSJowCbYmZ8Q51GIp96qBAj+mSU=;
        b=ahADlgzZ25fXW9EeJMsDZSuXVTswULRaZ7bFQ59QROSYoWeA/f5oigA+Drkaq37TVh
         u/KReYJoDgqYtwvPgIbJr0s2+Ulj+mLVtEXuYsSNhKjwP5Vhs7+dKBvrUgx7yd5RAefU
         I190TXQNerUMT4haWdY0T+z4Wa9DafZer+rsFLzo0JI1l9btwicy0uAZ+VYoz6SxJv5y
         ae/pXTS9j7Kr1DZm6Rt9MKtCiPdHGc0MKEalB94CmOYFtE0pQsIuynq3ze4JVeU4uhch
         l1CGmRh2gsPLhjCErQCQzQ/9NXtoUFnm9EE5viem3jD+l7h1fALE16kNMBEp1DcBPSYm
         0s+A==
X-Forwarded-Encrypted: i=1; AJvYcCW33s1cIZ0S2F5s1BybrMaHtyAVhyT8rXWzCUwbPXZkBdXi/ZaAjb+dEgeOIttUy1hJsxtM/6aqdz+Tng==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1fvAgDVtXiGAxuH46Kl8PiGRyI8cPl50EioHSRBkthneeDHY+
	819E8hgIUYaxNalm3S8jCZVvCyhX4zQP3VXafgxP7w1o/kp6wSEX5JsL1aBVbUXA
X-Gm-Gg: ASbGncvKwVhvGz/IqKiMRAJwQbFl/7yrkae9IuAPXdCkYiEu7o9/S7a0syCGamGqOvA
	pKNTj93iVjjxZjgtG6YU56ICs8wyC+1ub4z3nuhzjnvGqzs7OoEOKW8e8Mrvud+/zxd4RJpf/FF
	hpCcYNZq1vK5nPx0iIgLyab9uCPcH1S5TGw4jtyUmhNgnTx3w92TroaQKCki7qGz+hemUBAzp6n
	to5Z+Ssz8MyESJMoeXtKnXwr+6NIpq/yEPJ9fmhfH5C18GzxwCymECFH1WoDnZ+0BzkcctxWkn4
	VIx3L3fq+pC/a3upqB6sRTTZr+3Fc4FxqNMZE5PO8B+P5ExyIfJ7o06Bme6eMoz1KAEY250GDC4
	8rbwDqIUQhep9FLPCIPRmwP7MGGHilyBu4jlxTgqHmt0p8YvL4V+kYLFUFuV2bwvrYsa3lDD/gR
	yhNW9CiUpxb1SM3IqngMgNGdCAG0hh9u6O9HUtsaoodjY=
X-Google-Smtp-Source: AGHT+IFJwc5RvE9ia6kYWCtL5euxLq+I5wUdMaCWou47nsLX495ww28qgYwajCPPNAar5XECyOkPSw==
X-Received: by 2002:a05:651c:1989:b0:372:628b:5cb4 with SMTP id 38308e7fff4ca-37797a8d5dbmr26913681fa.45.1760863897621;
        Sun, 19 Oct 2025 01:51:37 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-377a91b7106sm12593821fa.8.2025.10.19.01.51.36
        for <linux-sunxi@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 19 Oct 2025 01:51:37 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-36a6a3974fdso35234851fa.0
        for <linux-sunxi@lists.linux.dev>; Sun, 19 Oct 2025 01:51:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqo/hQGkTACMEHsiDtVfZY7ZZKUpWDmwn6wj3cMoojDcweGLwUFk1bfsTWNRnIEOyCxh5T20M3doO91A==@lists.linux.dev
X-Received: by 2002:a05:651c:988:b0:337:e0e1:d11e with SMTP id
 38308e7fff4ca-377978ab8d6mr27450931fa.18.1760863896800; Sun, 19 Oct 2025
 01:51:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251012192330.6903-1-jernej.skrabec@gmail.com> <20251012192330.6903-7-jernej.skrabec@gmail.com>
In-Reply-To: <20251012192330.6903-7-jernej.skrabec@gmail.com>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sun, 19 Oct 2025 16:51:23 +0800
X-Gmail-Original-Message-ID: <CAGb2v661kowYSSNYJ5Bb05mRFJR7pZFym95Oyj7-R5kkPrzNzw@mail.gmail.com>
X-Gm-Features: AS18NWDXIVTjeyhWFEjy65wFSPD-aqsq49LxTr6pJCNafi4Ajfc1OGiZzxQr0Ms
Message-ID: <CAGb2v661kowYSSNYJ5Bb05mRFJR7pZFym95Oyj7-R5kkPrzNzw@mail.gmail.com>
Subject: Re: [PATCH 06/30] drm/sun4i: layers: Make atomic commit functions void
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
> Functions called by atomic_commit callback should not fail. None of them
> actually returns error, so make them void.
>
> No functional change.
>
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
