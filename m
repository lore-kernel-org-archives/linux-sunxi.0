Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B2C409295
	for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 23:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786403105; cv=none; b=c+2b6RhMyJG+5snj3n72n/GtTGyPNpPeh8joimXUhixVlv5Mg+F/2Hr6Ea5z55CTfW+6Hdo0G7j8v0VTQ0M6qX6dd9HMOAZMQHCtxpSnWklr5FWcbMXPNXxQuX2+nHwKyLOVsFv582MYy00wI246/enAWMJjiYCDc1x0skLJoMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786403105; c=relaxed/simple;
	bh=ElXVboDVMx+RJeS8aZQkdIhlBQth0O9J4VsPqpHF6t0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bgmMj9Fjfi03zmh1hVMytQRsV4SsaXXwMpnKjplr+MPkKN3xJ2T9qhm0dTDNtEoXU0/lUnINfnjGWBE2yOwBnpu6UP1v4lNVW4mTDmVXQlsuzRmF7O7ZHQRc3uUfsmjQF42avHlMyZ1+T6r26COKhx6CP1IWl79865xNisJEOVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jprmq4MQ; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jprmq4MQ"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7ec1e9d3359so187698a34.0
        for <linux-sunxi@lists.linux.dev>; Mon, 10 Aug 2026 16:05:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786403102; x=1787007902; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=nkXfL18wjL8DTexX95EbzIZJDQIzq4nnjKVqXhVM+tw=;
        b=Jprmq4MQtnvKxBDOyh0WYNJJYe9x/eIsuiuV2Cv3UBr6virqVlOp9Bm7yrpP6iMuAO
         yy+kmHhuGBRSeYsbd5z/UQIVCCuxzVt8ucD7iB5LzzoCjoLnuiXoZ4DxQcbBvv/qiXOl
         xt7uRkz8DtMb1TmEr4VJ8dE1UV2g/aPAX4IfxBxi9JCaxZAwdhdk0LQTeqnBXZxGajrv
         ZMN6oRymvHBhP7h1sAmv2EZx+vh0hygHyPHZEuJ5+uYHjuIA8yu1VVutPJmVCaieuS2A
         tmxKblmqmJVwffwwwnHYPFe+kwz9d39O+GS3Tf7YEsMrpfA91AwGcPy6oN+K0HbRPTSE
         5+NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786403102; x=1787007902;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nkXfL18wjL8DTexX95EbzIZJDQIzq4nnjKVqXhVM+tw=;
        b=NCqgMXE6rqGI2POkn7suJ+VWG4NnriguTR8Px2Q/9RsRIZ34ovCJXm/qz2Q9WJD7yi
         KEzpw4KGbmQxq7vxKsdFUvqFJQA8cyJ19vuWPHdDxvwMdom2NrxZXMHV4B7GwjXnz6lo
         itHcuokFpFMPFuEkAbUqpYKfOKV/toIRhT5RyxE+kWh3saPih5IN2aNviqcKOxxpvLFi
         23ZK/b8yKgVe9S4MqvFR1ZVozh6LJbVTc2FVTAKf/aIgwptMgH4eaLgcYjWVNZsXKf9p
         1wJCTK+ehVYMREVbuyLI+jrlP0OsE3k5mZRihB1bivOG8KJHxr0wlpxlUIXkY/W0RpU5
         7xLQ==
X-Forwarded-Encrypted: i=1; AHgh+RopmroZxzjRfHSPY0qvSe6Ln2dy9mjE+q6JExgA0gHOHwyy5uoiFL5PCtF5rT3Rii+rn6ylSdd0C9oqzg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvjjcDummslcVrxANqb5SvacTcCIdwvNsOnV/woUeQPgzExYZF
	qVZbDBA0NdTXdd9z8DMc1R6v+1bxWyEYKlQgF3ovLCB++LQGW0NBRagc
X-Gm-Gg: AR+sD125nF49EjIyh72cDoFeV7mlJVOs5LglYMrwQBhgBWG2TVC0Le7F8kBu+lsSuiZ
	RYhS0ZRLESwNL0mz+2b4vu+SjKjLRNUCj/SfdHaqMN2bfvMLP5MiF8qsR7t7SLOW78WqCOMO9RY
	dBDtDDLPA8fXZlyFfEtr8RXJnpIu1EnUrP3/9rPA8O/+Fkk4ayurK9kq3QgNlmncJT5TIbPLXhI
	yVnUCRrIHCdpKh2QdZTe45bToHh2vU/UOiuU0PuPjvCUQfsY6xjOAtLLpEM472KRg1t6Q0xGuPW
	l3oUnPcP2DdwXQWMBZioAZa7pLmFqR3mMJkx/sKpBSCkHRTlSAd4vm24tkqk17j55DcoDbLBG2D
	Vqh+Xh2E6WRiwy6T4ZXBg0Q7d9bsgI81tj7hT9zNCIArigTPgwCnnkOeDptJwDmulDSUGJwqgu6
	qkdZ4IfZgA3Z0byoVBgZiu0UV8tjI2pqHjABhv8JApxAMB5cmTZd395XxSRxdPoCvsgNT1Az2Na
	nRLu2qEHF/WdJcV5XyqzF54TgIJe4S7Cl79UBRBoVQm2W3n6prCAnwRs/+mWIOYtNVw1F/MF3x4
	lZjmpO+DAkH71DNTsvBDglDFndLvNErhAFZsl3Cj3qs0IimJ1pMytktCjLNp9D9TDzWLqvJMRwQ
	dxwgMyfZPkWlAhXQpKLcfL7y/CPVf
X-Received: by 2002:a05:6830:3913:b0:7e6:d0ad:5254 with SMTP id 46e09a7af769-7f1e5d8da15mr33431338a34.8.1786403102060;
        Mon, 10 Aug 2026 16:05:02 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f35b5a7616sm8921584a34.8.2026.08.10.16.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 16:05:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Subject: [PATCH 0/3] mtd: rawnand: sunxi: support the Allwinner randomized
 OOB format
Date: Mon, 10 Aug 2026 17:04:48 -0600
Message-Id: <20260810-submit-sunxi-nand-vendor-oob-layout-v1-v1-0-463853a14ad9@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNQQrCMBCF4auUWTuQaUXUq4iLdDLqiE4kSUOl9
 O5GXT2+zf8WyJJUMhy7BZJUzRqtgTYd8M3bVVBDM/Su37k9OczT+NTSxmZF8xawioWYMMYRH/4
 dp4KVUAaibSDHfGBosVeSi86/o9P571a6C5dvHdb1A2a1yZmKAAAA
X-Change-ID: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

The sunxi NAND controller randomizes normal pages, including their OOB
data. The mainline driver compensates the bad block marker so that it
remains plain on flash. On H6 and H616 it also fills the OOB space left
after ECC with protected user data. These choices produce a different
physical OOB format from the one used by Allwinner NAND firmware.

Add allwinner,randomized-oob to select the Allwinner randomized OOB
format. The property enables page randomization unconditionally, keeps
the bad block marker in the randomizer data stream, and selects the
controller-specific protected user-data placement. H6 and H616 use four
protected bytes per 1 KiB ECC step, capped at 16 bytes, with the complete
protected region placed before the first ECC step. Older controllers
retain their existing fixed user-data placement.

When the property is absent, retain the existing mainline marker handling
and H6/H616 maximized OOB layout.

The series first documents the opt-in format, then implements randomized
marker handling for all supported controllers and finally selects the
packed H6/H616 protected user-data layout.

Tested on an H616 board with a Toshiba TC58NVG1S3H NAND using matching
Linux and U-Boot implementations. Linux initialized the NAND, SPL and
U-Boot cold-booted from it, U-Boot loaded the FIT from UBI, and Linux
attached the same UBI with 2004 good PEBs, two bad PEBs and no corrupted
PEBs. A target-timed 64 MiB raw-MTD read completed without ECC, timeout
or I/O errors.

Validation completed with strict checkpatch, dt_binding_check and an
arm64 W=1 object build.

Assisted-by: OpenAI Codex (gpt-5.6-sol, max)
Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
James Hilliard (3):
      dt-bindings: mtd: sunxi: Add randomized OOB flag
      mtd: rawnand: sunxi: support randomized OOB formats
      mtd: rawnand: sunxi: select the packed H6/H616 OOB layout

 .../bindings/mtd/allwinner,sun4i-a10-nand.yaml     |  9 +++++
 drivers/mtd/nand/raw/sunxi_nand.c                  | 46 ++++++++++++++++++----
 2 files changed, 47 insertions(+), 8 deletions(-)
---
base-commit: 15a3cbce32994141252bb4ecfe3ff3a5d22d0b4f
change-id: 20260810-submit-sunxi-nand-vendor-oob-layout-v1-e3114d10cc9c

Best regards,
--  
James Hilliard <james.hilliard1@gmail.com>

