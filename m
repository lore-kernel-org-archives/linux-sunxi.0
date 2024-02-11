Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96BD25DF2E
	for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 20:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707683134; cv=none; b=K0ha3F+EdY+BGi3EFkeXA3Zl0oGtnfSNfNF+FnPuA9l3qbkFBaVdOmJM2jMifuGYAgu5nfU+d9S3KUd0F1ZxoGco5aoUrIUVv/7r9bhYiud9uy9gGziBfcfsCUC9aDndbFOBfwzXgTiYy415AEssW60jnfLHyuzt37dewdN6lJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707683134; c=relaxed/simple;
	bh=cKsT+yo9bDIWuQHdZCWubZ0yLxA1O8F71YQR2vqtekY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=C9EoUC+ItGFlARhrON3apDDUs90GOWCHCj33MAwJ6KmG7UvpI8wU2RpghK7FKgiXEm56QI9Mg6ZJF+wDC1R+s0TQgtdNAd9Z7WPJjj23Ue+jeitXIiGZK+CCLxknDG7SAdoH7rb7JWUlBHxaoAArQBoyXdQQyT0gUPdgDGVc2wo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B23lgEJQ; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B23lgEJQ"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-410dbba40f3so602625e9.1
        for <linux-sunxi@lists.linux.dev>; Sun, 11 Feb 2024 12:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707683131; x=1708287931; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wzUk6QWHUEzr9XBpn7ygytCnVDBjeS7SWKBm+yuB2yQ=;
        b=B23lgEJQs//uGgJP9ygbTv9pkXLnyGf5OQrHjYF8VhCrbf/lwCto3QJTZ1ccl/0OZu
         0EFy7uCi6QCV2hwT8vmWb1TQEblnNpPFDw5C30flvcWcoiFYMw7gu21w4tLiNUMgAsJX
         WhIzzIrtOmic+iIjTaCfxPSulQaFjndZMYTpjGqw4VyXsSZ1G1UgYOVAGsTRy+8aI7lq
         D/yWg4+rJlI8px7KpujmUg9Fr9zhmg7jBIDiqwg+1ksDYfmSWHRE32yBrao2NeSzyvtP
         zU60xe06SQ9msGkwuNxM8UZjUn67AwaiK7rpmfXFKcmwT664ZdVIH01FDQMyx+6HSRFF
         HKrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707683131; x=1708287931;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wzUk6QWHUEzr9XBpn7ygytCnVDBjeS7SWKBm+yuB2yQ=;
        b=sfjp6yIHACUNZEXbTP7CaHnWI86gYc2Rj01MZk1V+jKDVryN/QoFlhPb4d/5y33FtM
         HK0h+mnFqrxGhFUjSEX26RXJCrvA+x83RmmflhTK36YeFTGM1vGVZ5U+OhSjIMYn0Dy0
         P6i5STc79cQnS4oVXKeU885zfkAQvR4JDvP0DTseHFFGR6BVRbtN6DZnnuf8CrSQg6Ru
         0sSZ3PC7NEvo6XIHO28jJWsPFYmmFr/RtiXs500/t6NuZblULl13l7KFzKfCXfYt34Iu
         DrjPm7X3i79uOR55ZZ2WH5vAeNUW5zgxxvs89Dj1XglwUk8WO+31lclx23If2yryv2x2
         FxrQ==
X-Forwarded-Encrypted: i=1; AJvYcCXkoah2rcyjewzqCRR1NkugZLFqVGMjPAX6fRF/Qhf7eOwSVjePXeE/z5eV0GQRy90kpeKrxjjLl409XF1Hw7IV1ICh3ww9ZS/e2sk=
X-Gm-Message-State: AOJu0Ywagnscgx5Cs+xuiTUiHs3lE+a0GwQ/iXUkMpCuVJqw/E5pzkFU
	J6ytlBIidPS2Rgodm22KHM5yuLHxeFqage5u80oBNUVvVcNfG0eH
X-Google-Smtp-Source: AGHT+IEaVY5znKfVD9XsjVN7CS3SzQpOfjYumpoKGVzWl2vafk0TCZAz6Aaob8H5VxlKW41qHi6dsg==
X-Received: by 2002:a05:600c:470e:b0:410:78fb:bed2 with SMTP id v14-20020a05600c470e00b0041078fbbed2mr3903287wmo.19.1707683130727;
        Sun, 11 Feb 2024 12:25:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9JeN7YH2YmPav6AR+rfZAFuoB4MkJCOUsK1ExYPdg6dJ7JTHnFzbklfWa5rySkjhgSGHutvSccaXACHWTMYPTVY/p7anscul9ZRUHWkYqW6CWNGKpyJq3EUC1/hFy3ZgN0TOUxz36gO7Vi/gREGUHB7zJthRRYkCLotxmuryenthSW16nZFjgWGilTughQ6jQ0n/whIEgCJnDvClKgwgHrq1CDbu9iGfH/4Q4WoZgMA==
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net. [86.58.6.171])
        by smtp.gmail.com with ESMTPSA id c24-20020a05600c0ad800b004107dfa6aebsm6457721wmr.28.2024.02.11.12.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Feb 2024 12:25:30 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Ricardo B. Marliere" <ricardo@marliere.net>
Subject: Re: [PATCH] bus: sunxi-rsb: make sunxi_rsb_bus const
Date: Sun, 11 Feb 2024 21:25:29 +0100
Message-ID: <9236043.CDJkKcVGEf@jernej-laptop>
In-Reply-To: <20240204-bus_cleanup-bus-v1-1-bda309c4b829@marliere.net>
References: <20240204-bus_cleanup-bus-v1-1-bda309c4b829@marliere.net>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne nedelja, 04. februar 2024 ob 16:56:44 CET je Ricardo B. Marliere napisal(a):
> Now that the driver core can properly handle constant struct bus_type,
> move the sunxi_rsb_bus variable to be a constant structure as well,
> placing it into read-only memory which can not be modified at runtime.
> 
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Ricardo B. Marliere <ricardo@marliere.net>

Applied, thanks!

Best regards,
Jernej


