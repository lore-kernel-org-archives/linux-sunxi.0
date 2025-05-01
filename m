Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA32C253332
	for <linux-sunxi@lists.linux.dev>; Thu,  1 May 2025 05:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746075924; cv=none; b=AMQBxccBohSKWjWDRCIFLPu+YfNSFMupBPjyVn5/P3OjHl196SVQxFY2uPygikPE77UUEt0CNS57SHrppIRea3bx5rxvl2tDphlbqNWe7TTFYR9x07yJi07axSzvA03bn3qoCTs7AtxZF2UP50eUOIg3XKGiqhsmqZM3pbI6n5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746075924; c=relaxed/simple;
	bh=89ehVUbqomSF6K0l4N5MZoUjSBvF5esyiUm5mG5feyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ASFnwg0ExcCjfiXfuASFmNOp1ao2A9Lyp3s2K6ehQ2ncM5CnkQoFiSnxeCGLJ/EF2ExkVI5VYjXx/gCNOn9fuZtNVv3GLDDh6mNlsh4jrev8Vy56/3PbZNmMRyGDzVS3HdR0cR6tHBdHTvzMYFjK10+NnY9o0lC8NhDh4eoauUE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bK8lv0ZM; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bK8lv0ZM"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f4d28d9fd8so785223a12.3
        for <linux-sunxi@lists.linux.dev>; Wed, 30 Apr 2025 22:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746075921; x=1746680721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=89ehVUbqomSF6K0l4N5MZoUjSBvF5esyiUm5mG5feyA=;
        b=bK8lv0ZMz1ZX/S8ts6QpkxAM/Wd3hE4D56V2NPgvN0QYE8KqZwragOZgaWJm8lObgp
         2mdDFc1cIZ1kXF1Qb8I+jVnwqHP206iJb9tm34sFXIphSEBfdEM3mtLa7YswpXrG5Jwi
         LIif7wtpq8o0oeF+5vEpiSqkHydHedSziU1S6bhdcyjfCW+t81K0kvR4ThuxMk3jJsz/
         na3GJSY79ESu1xfJ+M/yikLucW+dj4eanZB06CLU+kUgzVS1AVxWWOUYJdVvYaDkurwG
         qmHQd/9iLhcdQkhgHjzfwKuSdsKrLMeLcny8XeVGGYS/EiYpEDSAzF7kG1EGw08PVnOG
         4ypw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746075921; x=1746680721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=89ehVUbqomSF6K0l4N5MZoUjSBvF5esyiUm5mG5feyA=;
        b=LrkVMg6r2Qeng2FugKD3IkSynqdcQnAEdtQtdAnF6kiukuvZD1uJZHQZdw31NrNJFv
         4lHIT0ABhAblZatsPPVOj7XwuKgmNkRD6QQV82hT81A+m15jgq75Q+KGjJuBquqRnp6P
         ETxs/g8cBRo49uMMjS9OxpVAjbAdwDI/DRzez9nCqrvATlswtl+i4VRCqkMD6BcUFNa1
         okO74WjAKaJow1RFOCYCy++7rb8TlVQHbbxF7xGNKSJerBIxq0fTohmt2KKYjLHAMevx
         riyOkp2D5beH66hguN9Uc1sTcyNllLG4FCS4cPVfhN0ebFdqNMVLYfiybYHcsMrifyvU
         r+rg==
X-Forwarded-Encrypted: i=1; AJvYcCVfFGjfG3UubNb7Es1RsLi/rxKWpKeQmv/Phn7lYlEMjMPbc71yeGmrQaBFoojZpNSKbf3xdT2w39Ur6g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxezq9QRwzYzH1gKYfXcdPtX3qse5EA4y4mikL5dKJWXELWSFCh
	1YiL6rtiI58w/49DUB/r+oRp6lg7c85TI8VBhWip6MJjkBMtY7AW
X-Gm-Gg: ASbGncsla8t9hGeWV//nPjdTrWjjWG6/Rj64RfSAz4kdjJhuESwWXoXGh42HVVs2xKX
	R3my8/1zFeQzfMwaWFtl588ACoolQmZZwcuHmtndfdvlznR3jDeiQZn0aIqkW4dDgdSAFiY/Zcs
	GV6bpIO0Wm1FwwNa/IIUUGvstT+rpVPyisRkCpaaeOhHJPahZDLn8J0aGKxn6R++dg9zFTlnI/8
	QKapKF+WDTLzNubzpMnkxu3d3ItgCFXEEjdC6uWOElO9z9ofHl0i7qr75fjGjH3P1zEZ5LUO95o
	irHyR1tFqYHxQz2bMONEvy/rdkKxEDuxwobGxAye+UQQtkUtlzt1ivqoxuCCGpw+qpntRDuCmii
	Jhzecs/dlK4Rn/x5L
X-Google-Smtp-Source: AGHT+IFslrSBgwP2oKjTyz3yJ6G0zEWqRhVwWhyXN+S+K5UzJwFMqvffPBISy6dAiekefanLK4YUUA==
X-Received: by 2002:a05:6402:3494:b0:5e5:b53:fd49 with SMTP id 4fb4d7f45d1cf-5f8aef17766mr5400131a12.3.1746075920933;
        Wed, 30 Apr 2025 22:05:20 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f7011fc361sm9510920a12.16.2025.04.30.22.05.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 22:05:20 -0700 (PDT)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, Andre Przywara <andre.przywara@arm.com>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
Date: Thu, 01 May 2025 07:05:19 +0200
Message-ID: <2220249.irdbgypaU6@jernej-laptop>
In-Reply-To: <20250430095325.477311-1-andre.przywara@arm.com>
References: <20250430095325.477311-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne sreda, 30. april 2025 ob 11:53:25 Srednjeevropski poletni =C4=8Das je A=
ndre Przywara napisal(a):
> When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the order
> of the last two arguments was different between the users and the
> definition: features became flags and flags became features.
>=20
> This just didn't end up in a desaster yet because most users ended up
> passing 0 for both arguments, and other clocks (for the new A523 SoC) are
> not yet used.
>=20
> Swap the order of the arguments in the definition, so that users stay
> untouched.
>=20
> Fixes: cdbb9d0d09db ("clk: sunxi-ng: mp: provide wrappers for setting fea=
ture flags")
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


