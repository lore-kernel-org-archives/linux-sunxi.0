Received: from mail-oa2-f12.google.com (mail-oa2-f12.google.com [74.125.231.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0396B3C1082
	for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 20:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790021182; cv=none; b=Tbyn/0hnjLy7uC4sdvkY8joRSeA7pyAOtccdX5P7XkwVo4CogFiHB2jzPZIwlTwPm5GVE2OfnCSuL6r3ltBL1u94KDABytJuURlbQR5fV5JNdlYJmjSUdqIwk36S9ZnGB2xUaac937bitv97es2sgCIOrHlS8XZkZWri6SDTzKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790021182; c=relaxed/simple;
	bh=HpKDDkYCd2Pwbo5rNqtxh4mKk7ebKSKtL7Zw/QAn2D0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IJmekpT1OyaszMmJ3Oc+QEHI4Dl5MgVOVLJpp+B6jKAQxh0XLLk6Bl8BqFiOInWJJ78FUbhVQMFkJ5SNiTg7fl3345sLdenVJ14aa6hZHkQSWHrT+4+FlDKKglg5+pA+cCd7SP/IR9fLB+L1D9+5JltsG+M4HMJr4JlbTHeabQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKugL/Ck; arc=none smtp.client-ip=74.125.231.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKugL/Ck"
Received: by mail-oa2-f12.google.com with SMTP id 586e51a60fabf-466cc88a0d7so2322532fac.2
        for <linux-sunxi@lists.linux.dev>; Mon, 21 Sep 2026 13:06:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790021180; x=1790625980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fv+RsZgscD5DVR4fjErqaR9WbVwonuHEK45e+ZT7GP4=;
        b=PKugL/CkJalUT5FoWY2Pbr+xKj3ZVwr+KWYtOmMgM8IdY5gzhO93u/Zir0aXS23vrK
         2NOyrbj/KYNwQjjGfogZrZ44jt/7M3LlKm8uYNnOtwcAbnNS6gQ0wrqmG5aVDOF7wv47
         UUUudTOtlQ1mf36muItfw5z/eqyDRzFNVm59YrOEsG5jje0dHWY2K9K9Er8Vyl1JoF0x
         Cy+WUA66wHu6qnMQmhGzqPn8AzIwKmNjXYZ/l+c1RNEt/B8ME8y52b2MD/0Tr6zVYraD
         BIh/JISOPiUqso+0vB6G00ZArol5uebMtHCQHLA2yWli7LZ/QfC/qnVpMdsbWQXxFzC+
         /TZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790021180; x=1790625980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fv+RsZgscD5DVR4fjErqaR9WbVwonuHEK45e+ZT7GP4=;
        b=JXgJ/MR5cOqL2Qo/zZXB3//CysYU35eG/vXc898wqqrjZpYfdqeS4dvAJ8TVrku0Sz
         +ieWqqdvqns2vkm86Po1qjrHKIfNQVqVgispd0hyTaV3284s8fHU01HYwO1qUkfPwZSS
         Q7HhG2LMv2M6w4HZKwa3Y8jb4YCeHB3r6y8xJVKy2RL1dwBjmQ7R5de16AeccEtN5yGj
         79Btm+NkVZtUaMMf/OuaP7cK0kJgNLU/WTYViOu10cE1/1HS3C7+PL39hn7fZ4xFJWCz
         xgov/MVL/BiemBKFTcS0bpnosf2Bhgh6LH3Eam39inJY1imi/G/CkXYif15NlPbxPFD5
         qpVw==
X-Forwarded-Encrypted: i=1; AKwUvBycRRJtquN1losFIkNAZTTe/W0Gs8+ujq6dZK6+oMaucY58RsxQtzs2jiqjM6Eyvja5544DP0C91hz4Rg==@lists.linux.dev
X-Gm-Message-State: AFuF++mnw2qI1eBcOQzWCBhC9n4h7Qm5VSq6Vg0ET2IBfuvQhX2OwCrM
	m0CrG0r5K5VeKcPvjYZxPMr0rFzNjRJxnws8n46u+YtKicAv+2O8E55o
X-Gm-Gg: AYBFou0B2I3JJAD+w2/JoJAthF7IExzFX/pppoSn74xVDdsIBrZ/o1NRLM3RNvUgYBp
	WaurQwE75RC1lBUqRqwk5z/Pc2iZ+/ul/xr8PpR+gEwzIOd8jw4AJAzhscBXxVMk0NYmqV+L4Fk
	Hj1OiipPMRYUCp340cy7Iao6rfiEO0kDnGE3rlHGUAhRorYzk16pUw+qGS0gkAC8ynvFui/teUl
	9pXqcCmRt+VIEhhiTmsG3dxAZG0khdvsqbbDJRozo9Isk9z1gyYPl+sOyrcbKlTCA/NvAl35ej+
	cy6tx6n1KUW4hRS6XHMWtwt6hR9mMP6v4FDhG42LmQQPlpuTxEDhEcDHBPJYB9X35nhuVHieRzz
	UO6Akwvz0BPuCg2BXkfp7Vus9oWp6UGxhl/WO/3R68UtMJA6iqLH+FMb8uFdEEn7JJwhVknRHIT
	tRNl2aG9YWLNH/roYktQ7dmAMf+tJE9VkGeK9Q7Mh2ljqebLTRYash0w3SVJGZFIRLZN6/VCrNv
	NM8H/VvawmQCygTJ5h71viQgTH/f4pTPMrE0+ao4it/7w==
X-Received: by 2002:a05:6870:5688:b0:488:5fb0:423c with SMTP id 586e51a60fabf-48f6c2071b8mr252272fac.29.1790021179689;
        Mon, 21 Sep 2026 13:06:19 -0700 (PDT)
Received: from AMD.home.local (dhcp-9-244-8-156.gobrightspeed.net. [9.244.8.156])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-48f6ce755e5sm170837fac.0.2026.09.21.13.06.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 13:06:18 -0700 (PDT)
From: Enzo Adriano <enzo.adriano.code@gmail.com>
To: andre.przywara@arm.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>
Cc: Junhui Liu <junhui.liu@pigmoral.tech>,
	Brian Masney <bmasney@redhat.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFT 0/2] clk: sunxi-ng: fix A523/T527 single-divider clocks
Date: Mon, 21 Sep 2026 16:06:17 -0400
Message-ID: <20260921200617.3180471-1-enzo.adriano.code@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260812201502.264919-1-enzo.adriano.code@gmail.com>
References: <20260723004856.55158e84@ryzen.lan> <20260812201502.264919-1-enzo.adriano.code@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi all,

This RFT series has been superseded by Junhui Liu's tested four-patch
series:

  https://lore.kernel.org/r/20260906-sunxi-clk-no-p-v1-0-cbde21c9fe69@pigmoral.tech

That series implements the M-only and P-only clock conversions, was tested
on the Radxa Cubie A5E, and has been applied to sunxi/clk-for-7.4. Please
disregard this RFT series.

Thanks to Junhui for completing and testing the fix.

Assisted-by: Codex:gpt-5
I reviewed this reply and take responsibility for its contents.

Regards,
Enzo
