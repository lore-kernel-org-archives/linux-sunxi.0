Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A88537DEBC
	for <linux-sunxi@lists.linux.dev>; Tue,  3 Mar 2026 04:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772510896; cv=none; b=E8rLnv9khCYuAGVQaMwJiclT5u1le9yBMAzHPNHsD+pgnOruwafhNXCCpeVlhNVSdlSXTrLQ2a0ZF2jFA3Xew0i2t8hqaW/TG93pQvh56mot838E/2vLlczGZgFd6zwjj2VWmJ78pViH1yZy2pDtT0NjmPHyv/PZaVL25OzywZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772510896; c=relaxed/simple;
	bh=XR7tI6mgjCUBq1mVAVYHHMgAe2A7qGWTwipNtUinZpU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HGrmtME8xgzw1OJ/GtvP1mZyGXtBYp3pKrDvVBFJ9ABhSDem4zgKGCJjsAKE9i3j6TfjhUe/2EPJeXBKxqke7OtGT33fcj7CUp4K5eG0/V40+izcuBwoADHTmEvRvwo7FfFqf096hhVCMlkhHJV7TpgbmoUcz6gROUHYPLOtZpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H695oyTO; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H695oyTO"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-483770e0b25so44179875e9.0
        for <linux-sunxi@lists.linux.dev>; Mon, 02 Mar 2026 20:08:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772510893; x=1773115693; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XR7tI6mgjCUBq1mVAVYHHMgAe2A7qGWTwipNtUinZpU=;
        b=H695oyTO3rjOLen9I6Cfwbcu+lkv8Z4KhNZzyjt/v4bfE5L39BRhd3Im5xat6qeuLC
         av7s+wFEYr7VhKKC0L0RyztMp9+LPCqqM3tyusgidQkpfpj5Ki3j+hyw2Wp7wG9TgSH4
         ZUNtM2s13MkNJUPWH6BK+lRnnZOhimmWQ0Vf2QMCaD7OIz4zBlpVB0qlW/i/PIn/oRWr
         UcvXy5P9orl/8EuVl/EmCpe4ONrYRCMm5g36vRs1gMnV8AUVXAPJ1CyFU7cn1jihTYmW
         cD4x0+6NpRvHhylgI0pk8eZBDZS10kAbsffQfXyhbR3FJTMF+Sc712/DR05JFJvbg3lw
         JXGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772510893; x=1773115693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XR7tI6mgjCUBq1mVAVYHHMgAe2A7qGWTwipNtUinZpU=;
        b=jOUk7+j4O8T0aa8Gi8FYhPDtsES0YkWcmEy7Y7XlTROnWnzwSIyaqifcqKhBI6xttH
         +CiFZbCXsElb1MPdsDcrKc/xY1f5xQpox9lUjkO/U5uU751MDpBJA5G1HNKjcXcJzQuJ
         iZURlMmiMbKLCgcnho39Cyi8BQxWiuw7xeIl88xKSNWC1TGuFeVbYQMuatFqvSThX/vU
         ihVy1Bfm9KNLTDnmyyJ+fHl5ip+eqabNt+5E7RCBHf+4mWv6tOv+4Gaw+WXjeZLqJbnd
         us7VkGTs09cVMGTbBFLnnhM5Se6/+oVwBEQUhW0Iby14KK6rPteJkaQN2YD5TrldudNX
         zwEg==
X-Forwarded-Encrypted: i=1; AJvYcCUTS7OefSJ0wrviyXvPyXI1fO8UOum8ws0H5F9j6qAGOe0a8hMfK2LPGc0IzSa5DUk+4cjcxH+gElkZ1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYLZ1zt7NfyTRRxq/05sRndol8d+p9uuH9tRbZ2CYaRUfQ6PQF
	G4BxgmXFPPk2AUd3Hac+WwJtKYm6v/Hu3icYogdqnWQIbzRMRcWf06xw
X-Gm-Gg: ATEYQzzxShzuG1jt6dWZiWPnwDRfAcKD328cMlyWftLHj3JG9GZkY6aMmLoJE13dLZB
	52yypwu9xBp3PHw5jCqRCIvOChpGZDvtt+7jZjdfxZotYD314t0uLgFGTi/C2wA6ligaLu7MjnS
	UvHYUe2lBCdldNDudx6emrVhVPItgSdTT2ZSI7TYrgzppFpWjguQrb7007eb0y6eNy2W39h908e
	bCTNZitdFV2e9O2P2YlIHlP6ZOyAapE4vArob+nxoMMoixWMEDx7emdyQQj8+hrhjYWylQEGCp2
	XMoOfU9iG6EicnEIGzS7Cb3afeR76Gt1EiUCp7McjvBnQkniFkhqF6fuSU6Yo+hj3ri3E6Csdzk
	SvHcV6mQ0TrXTbdTu8BTBdD3l/2ait3k1ZJbVguYXwlI4WyKB5hO4V7p2Brtsj8l0gu6ENKD4K+
	7yn/Gtg6juRMWpsCvG4jCN3FFKiwLNjzwxo73GaOlbOvOq2EGKXN85DB3OONUau4vsxw4DyZUoQ
	WrTLngO
X-Received: by 2002:a05:600c:1d0e:b0:480:3bba:1cac with SMTP id 5b1f17b1804b1-483c9bc55c0mr234488635e9.6.1772510893358;
        Mon, 02 Mar 2026 20:08:13 -0800 (PST)
Received: from jernej-laptop.localnet (86-58-126-118.dynamic.telemach.net. [86.58.126.118])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e6c9sm393590355e9.8.2026.03.02.20.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 20:08:12 -0800 (PST)
From: Jernej =?UTF-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Chen-Yu Tsai <wens@csie.org>, Samuel Holland <samuel@sholland.org>,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
Date: Mon, 02 Mar 2026 19:43:07 +0100
Message-ID: <5969539.DvuYhMxLoT@jernej-laptop>
In-Reply-To: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Dne nedelja, 1. marec 2026 ob 15:49:39 Srednjeevropski standardni =C4=8Das =
je Andrey Skvortsov napisal(a):
> From: Samuel Holland <samuel@sholland.org>
>=20
> The register address was already validated for read operations in
> regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operations
> have the same set of possible addresses, and the address is being truncat=
ed
> from u32 to u8 here as well, so the same check is needed.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej


