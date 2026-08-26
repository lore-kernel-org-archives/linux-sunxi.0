Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85F2F3B058E
	for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 23:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787785668; cv=none; b=fxcHBJ2LzLPR7a+CXPQXGoOK/ql8v0QCISDlme/MMOapPAdGqibVfyopRoJyYTtxEWDHTdmOQXxs6ALur05qiETX0FdkmGbgmPQxlbHtP1jdZ104jtGcKFo3uZxD1lEaPHhiqTziofpNLINg/KrZSSVYcsNg7FNsrvDBs4wri6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787785668; c=relaxed/simple;
	bh=6EgQ4h8sCnpkkI8smYfsOfZ3mX7SDEKGdmQqZFbaaew=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WB2mm8K0bXIw5gDwD3WnhP2PLwVYX+YzSgYqowmJbOj12J06pIlXD7k5HyOuqf+XxfUGJiXB1EQyAzxtDJ726cL2BHI6spSN8D88Vpayh8HCIG6X6Zql1k9bYsJCSZJ0X9K/zk2Mfe/T1A/PhYDzL7WNwt2j6KlVmXM8EZNJgiI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kzTtHU9W; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kzTtHU9W"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-97c441e66f0so806582241.1
        for <linux-sunxi@lists.linux.dev>; Wed, 26 Aug 2026 16:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787785666; x=1788390466; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xz31B2dhBshUWYNwR3Q8xs3ULxEyjpdBo/IUGet1XKc=;
        b=kzTtHU9WtqqOao0uhKRHJgfbTAGF2k9V6KZrRsorb1se50IcecfE9V8+CupieuxHed
         75o35SS3xtnEcd6YL27d7HjFIXwx0rgp74vhm5y0U4SkcM757h4y4L/6PQf/tnGt8joH
         bIZlBZauazqYKLusNk9LwMdBn+/2TK8zDSNoU2ql3xXVL2oxtUn4gK35P92XYE16EmyL
         mEf9HyJkmM3BuQJkS7ik2f1NvfSrKupEN9pHx3Vlfw2Mw/yC+F0q/mNKMrcIlmx4eFS/
         OUips/y2FKal0dcRC/rdgPR4LVs73WemXwWvnMjN2JLMHQptacMaT/doludtocvkroy5
         yuMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787785666; x=1788390466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xz31B2dhBshUWYNwR3Q8xs3ULxEyjpdBo/IUGet1XKc=;
        b=mztAf6vrBbA9ssf27qSfnH7yxgCd2ai3D0UuiVr2ee5nSchUJjxVYXLoWT5kGKn6qh
         31/v/6ipeFzVsaclpQkInZQHss+kch8EyQMNtqVUf8IcAd73GP+gAqg6deTUdIW0Xo6J
         v9iDap0KpH1p7OyezTtvhWGn1fs2smXLkq+Soty19kKo+Jb3gm/dSPvayEQC9Dbvf+8s
         gPwbhrs487buMmhhFVus5LseGF6I2lqRgQrtOwRjR8UCIxqKgcw2xrtBYaVOVCGOEiNr
         nzFBLtA2XntTH08y6lMuKZB97HTYcGYWmb0KqiRIRkszPWiEAmq4DyhTr9ZArsJ6YmFB
         13Kg==
X-Forwarded-Encrypted: i=1; AHgh+RoQJjxfznb38OdFT4TxqkA5ONF7MbEENeMFtAIajDwtKrO/7sVstWgzGgY2V8LevPs9yKYW9DXhAtvv5w==@lists.linux.dev
X-Gm-Message-State: AFuF++n2tQ0BukLqxO9oYqnixl0R3uMbI4OyX6x4gDAWOBO6v5Owwhq8
	GjfuOTARVQGxAU9SER2hFtmpnijfLMTaOV5xnKOn900uRVXQYuxCb1ds
X-Gm-Gg: AR+sD105YIGHcPDtzOPYBOunV+WjvVoH7pvU3vVwI0G+B3tPWx+gbZxj4UfNmRMdnmC
	+HSwvoeMby2DnX34vhqyPg3bQb78kEc9pW9nQRqcHuY9vCp0jpplUffqkZhaJvoVOjtT3FVTmLs
	NRYcskPelUrL0AbukqdR21r0jmesocIQen2kwclrwgaREeoYYWPFHVvIIkbbQlBCQNxdtuRMCfV
	6/bgpM2zDAPyr21XnD4BXHOGrq8SYR3q0mwR247xhTocouyduYyiYTwGBfFt/EFVQYlgqGrmHs1
	GzIF+QZemfpU39Sb1XkpWyJ/gQAhoVKtSeNpwV8MhM4yYxYJVeom8mYTYAbHl2GBIAlxZRJdorb
	pnDF6awmsdcnpQrVerMfrC+76iw7kSP1tZfa1TE/Oy/o/kc1CqMdKkAg4yYjiFS2sFv82ImF+5A
	s7/6yj6hmIDyGuFmBo4z83oLhRGEJ7xhTfnqQKE6u4MrEh3C/1RXdvqcDY3GlkGVX/CfHrrAFg/
	DTni2nBHM7mhCKm4DzyGMe8aqqv6ifnN0ZLVOcAxSikAJ9q6jVFIRwdwUNX5MSv3QAJfZ/oICLd
	L1YLZKM=
X-Received: by 2002:a05:6102:162a:b0:77b:28c1:210e with SMTP id ada2fe7eead31-782bf9bca7cmr4267611137.1.1787785666335;
        Wed, 26 Aug 2026 16:07:46 -0700 (PDT)
Received: from MaquinaLab.. ([179.179.239.222])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97cbe0ae5d2sm3311701241.2.2026.08.26.16.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 16:07:45 -0700 (PDT)
From: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-gpio@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [RFC PATCH 0/9] pinctrl: sunxi: Allwinner A733 support
Date: Wed, 26 Aug 2026 20:07:16 -0300
Message-ID: <20260826230720.466026-1-vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250821004232.8134-1-andre.przywara@arm.com>
References: <20250821004232.8134-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andre,

This series no longer applies to mainline. Patch 1/9 fails on current
master (45c13f3f9e3b), for two separate reasons - one of them from
outside the series, which is why I am reporting it rather than just
fixing it locally.

Applying the series in order:

  [RFC PATCH 1/9] pinctrl: sunxi: rename SUNXI_PINCTRL_NEW_REG_LAYOUT
    error: patch failed: drivers/pinctrl/sunxi/pinctrl-sunxi.c:1521
    error: patch failed: drivers/pinctrl/sunxi/pinctrl-sunxi.h:88

The blocking one is your own patch 2/9. It merged as 42e06688c6cb
("pinctrl: sunxi: pass down flags to pinctrl routines") without 1/9, so
sunxi_pinctrl_init_with_flags() now reads

	pctl->flags = flags;

where 1/9 still expects

	pctl->variant = flags & SUNXI_PINCTRL_VARIANT_MASK;

as context. A 3-way merge does not resolve it - both sides touch
adjacent lines, so it conflicts.

The second is unrelated to your work. 70f8915ea4e9 ("pinctrl: sunxi: fix
gpiochip_lock_as_irq() failure when pinmux is unknown") inserted
SUN4I_FUNC_DISABLED_OLD/NEW into 1/9's header hunk context, and added a
fifth use of SUNXI_PINCTRL_NEW_REG_LAYOUT, in
sunxi_pinctrl_irq_request_resources(). The header hunk merges cleanly
with -3, but that new use is not covered by the rename, so the tree then
fails to build with an undeclared identifier.

Patches 3/9 through 9/9 apply cleanly once 1/9 is resolved.

Static reproduction only - no A733 hardware here, so nothing in this
message says anything about whether the series works. I am not sending a
rebase: which shape 1/9 should take now that 2/9 is in is your call.

Vinicius
