Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E93D3B18D
	for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 20:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706043492; cv=none; b=cZpXZE5TIWtTB0BkyPnPYaXg6Fq/eNZeGaZBBA6A4dxYmBAF2JtVx5BC8fRo2GdGOgmajirTHzVzifs8oF3tzXtTKk1fvKdgjS68W1EUzcAanVsorWeUeew7cBD2vVTN6GGkfnjaXKO5bN3TzQSeiuD1d19FZLICFyAbmaQsuSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706043492; c=relaxed/simple;
	bh=+LOWtolt7y+KJAN1QYznwoNgWUtDvoht/BbgXsXbBVI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L7q3JUXahVyhHocbhzO9OybDKsg+bFVoVsMuqLFchg204pdrDECVkVZF8xtXF9oOqDuzotH659gkbxbTYImEzQgvMQYe27a+UNbayT3tCI4uYR3mfuUdeCXN+Bce0oVTa/WPwE7g7og3QTfLUustX6g91czVvK9EnxDdR/0E0Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/yYUYe7; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/yYUYe7"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40ebfc5fb19so10129805e9.2
        for <linux-sunxi@lists.linux.dev>; Tue, 23 Jan 2024 12:58:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706043489; x=1706648289; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+LOWtolt7y+KJAN1QYznwoNgWUtDvoht/BbgXsXbBVI=;
        b=L/yYUYe7z0RVG8baWHxJ6f2MYndSCbNisdKpwU3PT94cQEqHClaL+Lhq1Rwk6CI+xT
         0fI+/dZHFzCAStkfC9bohyxYuJcebHm0b5H4lhCmI0SLfSE2xg89j5W7+ASXbD1NG7oh
         0t2Yh5FFH9CksYzu0a9V6TVf7McMiIqbhRQON9WU6iSulxbREc/rJ3wYFc01fF43PzlH
         zUJ9puPfO9vfUrQOe/U3036SalHKiRG/vEzyh0mWyNRgKtyHGzgZ2fMRmmCoYIINbXgp
         LvAYryxRqU0M/UcpN0f+FVk8EcwN9xec4ntg6H/cqGb3qXO6RAOVChDlNheJAjuJEQDn
         HCzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706043489; x=1706648289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+LOWtolt7y+KJAN1QYznwoNgWUtDvoht/BbgXsXbBVI=;
        b=ob/REYKyzvrwEd62E0OBCSmKJliOHRO1v98npxH0jn4VEQdK82KufszOePc2H7eDWs
         6BCHpRY5XTrnus3ThkfYkBLn+G8llxIvYdQNogX7nq9FzpD4SX2eSiE4Pm71hZWb5en5
         dUTYofhb2HLgcKgTPb1uQBCVEUlXA8cTIRr5rZNXxHsKrW0lUn9V4HDBONKz7nIjiABC
         rmQ+Ty1V20iVMMjRnbU7KJXlk6ZAEjPfSLURlKI0iNqPYLRrcPhZAO5xhHkg9kme3vtd
         6opPlXAKhXQUp26oeHP24wctAJvX8G/LYBsn0IQ2a+vGRm+x2/gyQr+LIYpU/+lHv9gW
         WOzQ==
X-Gm-Message-State: AOJu0Yzozv83hfobB061PiyxvxGuNu9FIdsOOQwREQ3Qgz+4Bhkn85ju
	DE6/pW9qnV17Z1DWUGzL1zBxVTyg7bGDx1XEkLSylffYciLlOsLY
X-Google-Smtp-Source: AGHT+IHJwJQzACZGeE+ZISr67jPpv8iwqwd1Q++oJrsbIZQfW7cpMZ3Fie62qVDgEKwzt1QwHUZ9hQ==
X-Received: by 2002:a05:600c:3caa:b0:40e:9ef9:838d with SMTP id bg42-20020a05600c3caa00b0040e9ef9838dmr325295wmb.159.1706043488748;
        Tue, 23 Jan 2024 12:58:08 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-14-70.dynamic.telemach.net. [86.58.14.70])
        by smtp.gmail.com with ESMTPSA id q20-20020a05600c46d400b0040e395cd20bsm47421305wmo.7.2024.01.23.12.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jan 2024 12:58:08 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>
Cc: Randy Dunlap <rdunlap@infradead.org>,
 Emilio =?ISO-8859-1?Q?L=F3pez?= <emilio@elopez.com.ar>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 linux-clk@vger.kernel.org, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] clk: sunxi: a20-gmac: fix kernel-doc warnings
Date: Tue, 23 Jan 2024 21:58:07 +0100
Message-ID: <3464017.QJadu78ljV@jernej-laptop>
In-Reply-To: <20240121051837.17564-1-rdunlap@infradead.org>
References: <20240121051837.17564-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"

Dne nedelja, 21. januar 2024 ob 06:18:35 CET je Randy Dunlap napisal(a):
> Move the function kernel-doc comment to be immediately before the
> function implementation, then add a function parameter description
> to prevent kernel-doc warnings:
>=20
> clk-a20-gmac.c:43: warning: expecting prototype for sun7i_a20_gmac_clk_se=
tup(). Prototype was for SUN7I_A20_GMAC_GPIT() instead
> clk-a20-gmac.c:53: warning: Function parameter or struct member 'node' no=
t described in 'sun7i_a20_gmac_clk_setup'
>=20
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Emilio L=F3pez <emilio@elopez.com.ar>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: linux-clk@vger.kernel.org
> Cc: Chen-Yu Tsai <wens@csie.org>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Samuel Holland <samuel@sholland.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-sunxi@lists.linux.dev

Merged, thanks!

Best regards,
Jernej


