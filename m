Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D1F49B5D9
	for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 11:27:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790162851; cv=pass; b=TO0jagxCkact2Q1iMztH/X2Hcntb871xnHCVdYAdpTfvOXOh9/fF+4Jev6Os5cUqTbZvySv+NANKQFtADH/2qHy4Nwo4xsug8zu6zNU9GJ3r7FvHSEq8VLrL257UgrNo7pI6pTLSfDSKY6e/rmrNd6giAgfNexu/huIvsxFXQQI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790162851; c=relaxed/simple;
	bh=vvqH2hMZEJwHoLtSUckBQaIVNuafjtZTn5EFVGWbHec=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Uhy+5rKwRHUPCd6EdmiRidYuAJiuyPtFL1zDpK0LnIfVx1EA9ny2Xt4jnTGfszlwLxytC7VVkhRg12XGKTJRGAHVo3z9q/URezyjpuiPvhcK+d/jPj9So+HWSZTlOGStHfcLW1lAKs6cEwLoOo+dlVi6ILotIiJ4Q5Qb2FLpqqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HrLQgqXs; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HrLQgqXs"
Received: by mail-qk2-f12.google.com with SMTP id af79cd13be357-93910cadeafso54865885a.3
        for <linux-sunxi@lists.linux.dev>; Wed, 23 Sep 2026 04:27:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790162843; cv=none;
        d=google.com; s=arc-20260327;
        b=Ktyjlzo4OlBSDm4HdRwH2GUP1RA7ZN1b888iZL5g6qm9QD25JFF/4EZTNPILoItw8N
         ZRJfozR0KiVIf04EYtWjRlBBvF3/b3ggKF858iasVJp61EeeNtAbCddlBme2z1EvUl0z
         r9go5+5VhYWaz6YOK3gcROoUrlLlVFpnLybZRGy94xEEHYW5WfqTxNc1dMG9Jd3sPNdm
         +X6pcCytatcORHhLySVMLFakwQEBdVkt9jJ338tdJNki8r+l9NlovffGRmrcORuNdcqX
         IcoWtxnfHo1sF6G7wi1/NnGORQLg8SvXFa76GrEtwBvOSpdFlujTA/Oy9TS+RYt8cKbA
         /rMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=vvqH2hMZEJwHoLtSUckBQaIVNuafjtZTn5EFVGWbHec=;
        fh=RFh5y8scINFDRxLiLLqCP1Ei70qZGz05gqG54+DxXis=;
        b=om5dV/FDhFhBWNe7HBaTb/oKbWCvoJZ4ZMbzMc+HnNOT+zXQYdjQAOVdjYHH7UULfv
         zGTslb1BXToE9UFXOFKjSHjr5KhoMeUMgOJsfoa0KLeu2ZJ76wJdQGrY6GSJMjVDLpDR
         9ajnIovhSpcNRq6caGpsWSUuclSZH2mYJNMc91xo9Cm0WqfV1N7Q6QVNUjrLVPuGBA+0
         Yy2Dnt4x/mxEuzNyp58dbfaQhXE7aXuIEhGGkqZGOUgqBphzVh6QkYKE1msfwgeSxsAB
         K94mMDSBZdjHtUixK2HLwBbcoq4fNoixIOXNpCENUGceALaoCyW6cqNY5SvoxlJiZj1P
         +AhQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790162843; x=1790767643; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvqH2hMZEJwHoLtSUckBQaIVNuafjtZTn5EFVGWbHec=;
        b=HrLQgqXsWo+giaxxLeRyhsjrjdfILyHa+KCEtPNAC8IfViPilflPl08f5tiEBpRRL6
         U5bP67RdVVLcHqWcrxsndvHkZjZwAqz/AReojVPPKcliWq8EHOQvnqvV20mADSD3EzX3
         nT8ATRTpOGcClxkL/a/VLl0y9dlWp5lvHwOwa2t+4fzWuuSy37ukmUDQ95ZUB2HTEatp
         OFBubIQ0mfOdjQbUjCX4RrJona3uBvjd8rLIHIm4h7lVXhTbIoMCcSe8OuO2h6RSqtoa
         5tFC3hwZpkffhDLx7jv9hruSzf6x3l7ZYTXoGWa8cggXFRbs57UGMfPKcqLQG1t7AN3v
         v64Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790162843; x=1790767643;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vvqH2hMZEJwHoLtSUckBQaIVNuafjtZTn5EFVGWbHec=;
        b=HpXQGW/jIuS9EVS9x8kSB8Uv/4ZNY4uVFcWpaHrlFHq38TbgR+p0qegEB+sumQQ8KL
         pESdimTzoSr2xrD0T8cyVoB0Wgx4Ih21LW/PGlovnf3WPHv2MIL0+DPgc1oeINPz4nJ6
         dVC0HDXvBpJxPllj1E8DtNqlMw3aPOExA3ezAErPWETzrUAkYcQeOHpybnp376VdVddS
         RRyTSFhxSLQqYPEL4hvjcvUQqz8SKyny/3XsEUrF8BXo65qOkH9HTJe7ojvxL95SAJYc
         f/RKVcvSYccZE3rsdSmouUj3y31GyyELAkmYDJ/X0svnRi3noPqYMZrl6VcYseXBuk5j
         RDBQ==
X-Forwarded-Encrypted: i=1; AKwUvBw45vjGEKS7gH2aiOGFjHsX4YBoimYzGC9PC8xIbZb3gXwYoswTm2dxsunKkRAec5zDpOTPBTz9NLxyTg==@lists.linux.dev
X-Gm-Message-State: AFuF++m8B5Z3knYEjXBP+5ff9r7R0iJb+Rphbeufj/T2U4apy0GjdgEJ
	4lqjFRUtIkYExzuYMvN5p3NI/py04wrmH2gkG9mJqIdsjlh66qpYTfwruVzWF5N73jtuStgOsba
	6+glARGwa0zW8nu/L+XhygzzHrrbhmOk=
X-Gm-Gg: AYBFou1VKA8Iw7vNUdYIo8KG7ykliYViwrJk496abQhk1LrGvrjEIXMTCwF/siWs3w/
	Em2W5xstkR2V9obwL0QQC5BTvlyYvPI7+/fTOlWJFBGACWVs3K60wgn+3hN/9pBna0aBbwnSkRx
	CmUDcnoc6vgOdFU16ClTt1sNcDMr/ez4fBjS28QMdK40OK+a1uzUHvyxi/+k5zl2P5tIxREbqfG
	+Q1eUuk5g8WAszrHwTu90i4/REPzuMmimW6kijRmIhWBfcr3y/93x7JnzMcDTR3xVgijXcXjqTU
	p+0SJhYboRttCROSBhQKpV7hsDUqi5iqFwt1MNQHCM9HOVHlez/oldWvQg==
X-Received: by 2002:a05:620a:2a07:b0:937:2d64:57ae with SMTP id
 af79cd13be357-93c24f0fcafmr343702985a.0.1790162842832; Wed, 23 Sep 2026
 04:27:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260923105757.260-1-anykey196@gmail.com> <20260923110700.C331F1F00898@smtp.kernel.org>
In-Reply-To: <20260923110700.C331F1F00898@smtp.kernel.org>
From: =?UTF-8?B?0JLQu9Cw0LQg0KHQktCd?= <anykey196@gmail.com>
Date: Wed, 23 Sep 2026 16:27:11 +0500
X-Gm-Features: AclHuK_8X2-F2vjZ_B5cnOVtrt17GVI8L-zKCbR7jOO-TwWiv5aNx_f1whnBR8g
Message-ID: <CANHPwATb77aewMK=_twoPkUcWy44M-=jcAN9XfeZwetJY=nbTw@mail.gmail.com>
Subject: Re: [PATCH] Input: axp20x-pek - add AXP313a support
To: sashiko-reviews@lists.linux.dev
Cc: linux-input@vger.kernel.org, dmitry.torokhov@gmail.com, 
	linux-sunxi@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

This is already addressed in v2 [1]: the AXP313a no longer reuses
axp20x_info. It has its own axp313a_info without start-up/shutdown
times, and the startup/shutdown attributes are hidden through
is_visible(), so they are not created and no out-of-range access to
AXP20X_PEK_KEY happens.
