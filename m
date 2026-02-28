Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A45EE54B
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Feb 2026 01:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772243254; cv=none; b=H1Jgh+9h/M87gCwz0vb3vq6SEdj3WQKmDMxXbABhxiQfDu00u+pCZzkUj8jPKxw9egaSPmHvAwEp4u4vjzQifoKRY17uJ5fj/Cxm8CcYFKfNXfi7U+li6c3bPXWVbEJo2aq5pP3AIgW74dPD9BICI/USfQUeLFRNDAA3RLvK1/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772243254; c=relaxed/simple;
	bh=kzLke4p4CBWVI/C3pxjA5vKdqdSS/ijW2W88xu76WA0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=fxFgKukxaQzoZcfVqRf4S+I0kBozAQ8/bo7DITfEd5fNCXQUp3eEPubyMcdtVfxr1Qwyck5pnvE6KPdwF3UutqERYa6X2uAge9jVaCy9sS5B2Q0FtNJf4c0USUTe5tHWeTfEy1JHFTdiScAUCdMh0OFofvlxtw5X8Fhfdx+45fU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KGc/120m; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KGc/120m"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2bdecd00ebdso2018640eec.0
        for <linux-sunxi@lists.linux.dev>; Fri, 27 Feb 2026 17:47:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772243252; x=1772848052; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYm62l7h9IssC8pYlAqoKgXtyHZXXq6P9yH72X8r6sw=;
        b=KGc/120m13T2jWYFCLUQkguRlnQU1TqLcRz6gCAqZ/fucQOV733P6v/eDF/kZPjWIn
         n8cIumOM4jgFm462junvVt6z8pK7fk25UgemK+TineJrjsnFqEHvbd+s/MgrpW7cj3Ac
         F5aq1fgcwcPq0JQXMJGa0lhoAkfYe5XyXs8zkt27zwRig8zl9nq2VrQ9NKGJ1BRRq2XM
         c5dOoHLSnyQ9qAxOKEYBg+kytYqjaIk1siEFarcPgjK1MSUNbwexaJdswPgr2UEXzeTi
         KXzzVdwtIIohs3AVQ1iJZlvWflT3Jys7q4baa+XiIntJdgGQOTcmgwpO2d1FxUunTJHX
         EDOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772243252; x=1772848052;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nYm62l7h9IssC8pYlAqoKgXtyHZXXq6P9yH72X8r6sw=;
        b=Zeg4wtCtRf+gWPjKfLVwL2mxZ8mjO53BUcySwKdER+gU0Ajqd0x4RzCY/rlXKGc6y1
         phh01Se+Po629vAcYfTQP/JwrLQ6Be/oD8nj9PuNnL6k7hrH//c/oCoT67/CpOD+8rXN
         cCwqmMfR+dvVOk4+nmq6w/qcHhL+fb/6nUffL5FqUPw/A4ecDFCVALaz766Bp3k0NkA5
         BRatLu0h+G/WMOhU6RFiRQoSkBb8T8OEFM87kiX0AmoQF1gyiOxzncGpSUN2vy+sUbW4
         oK8Gg0aiaGn3s4w+Honv/SFWbqykPAbfRLkdQYd4MmSz2Ap0id86NoamVTBZ99/AiTT0
         venA==
X-Forwarded-Encrypted: i=1; AJvYcCV7NdmdRDC2Ud8tNTrLRlJS/QQGAnWI6a1vMq2Gn9JUNnx++/qONcoSzufif6Iz7L4X2RzqOK5LHPBpXA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBozWUT8QTa4VXLCAuomq4lT46yRIbwRTy/MOWfA0yiiht9CVl
	bRj2KHApld9cqbhJp0xDvJLzVaPHOkebpjZ3cYFLR8UA3Q6Rcs1K6+4p
X-Gm-Gg: ATEYQzwU3T/3faNwvFKfJd5DTg95PxeKZeVZkjSc4xHJGLZbhYcLlFS7G7G7DUTRdQ/
	R3oo1W87j60PrwYwnZDNZiq1ykuYbyc1P2J+BW7m6uy3ipxTxnztcQkDDWMt4GdfQtKDPondi6k
	MIDF3qQBYtCemrbZXpnufdgYdBV5WS4GiWRojNdImCvgDH65+EmFhIxDb5f9NKujZ8UkgqASRna
	NczhAXIUky02NVQPE1K8YxGEQt9eXqZGV/S3bBwtCSNx4IEYLgGQUqiMH1ktdpJnk99yfoaNxRP
	Y5KA/tKj2GZ4z8FQm5cDSdgt80Hpi+uMK26BN1veZes2RWoLR/ovouHFHeTCAuM5fcapC7YnBpG
	rBN2fmEuTsV/TKYyDjHm66Ud/pObMN1mXUIR12GEr40ZFPpLZgvyLVozC5MI6rphIvnPj6GOozs
	TZ938R5VlAQSv7zRsYqy/405oV5fWqdMfHmIu56AU3l+bg72+i+0qHIj1sD4coMeTZn3vBecn4
X-Received: by 2002:a05:7022:20d:b0:121:9f05:7e4c with SMTP id a92af1059eb24-1278fc5c3demr2053905c88.16.1772243252369;
        Fri, 27 Feb 2026 17:47:32 -0800 (PST)
Received: from arch.localdomain ([149.34.251.245])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12789a43a18sm7734470c88.13.2026.02.27.17.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 17:47:32 -0800 (PST)
From: Jun Yan <jerrysteve1101@gmail.com>
To: jerrysteve1101@gmail.com
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	mripard@kernel.org,
	robh@kernel.org,
	samuel@sholland.org,
	wens@kernel.org
Subject: Re: [PATCH v2 0/3] board: sunxi: Add TaiqiCat (TQC) A01
Date: Sat, 28 Feb 2026 09:47:24 +0800
Message-ID: <20260228014726.258796-1-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260227155801.211376-1-jerrysteve1101@gmail.com>
References: <20260227155801.211376-1-jerrysteve1101@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> This series adds support for the TaiqiCat (TQC) A01 — 
> a set-top box based on the Allwinner H6 SoC. 
> Originally released by Ultrapower(UQSoft) as a blockchain terminal, 
> the device has been discontinued and is no longer officially
> supported.
>   
>   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html

My apologies for not including the Changes section.

Changes in v2:                                                                                                                                                                         
- Replace "UQSoft" with "Ultrapower", and add relevant explanations.
- Link to v1: https://lore.kernel.org/all/20260226084850.417731-1-jerrysteve1101@gmail.com

> 
> Jun Yan (3):
>   dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co.,
>     Ltd.
>   dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
>   arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
> 
>  .../devicetree/bindings/arm/sunxi.yaml        |   5 +
>  .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun50i-h6-taiqicat-a01.dts  | 361 ++++++++++++++++++
>  4 files changed, 369 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h6-taiqicat-a01.dts
> 
> -- 
> 2.53.0


