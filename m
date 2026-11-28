Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=45.254.49.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795858798;
	b=ctM7qUiUBOTk9tTVDOwp/nn1FFVIuf9pL6Paibo2NmnT7yi3AJ7HAyK/2RL4FvJJhBgV
	 dCOG4PcLLqFmVWQq6LsGkG4OKEfMudIRh7wEgX2jge7lblc5ff587PfHs2le3IrIEuEcu
	 Potc+dWZGHyA/LZCcr1rdjrLPxk8QSvGQBw8mB0zs32FLmbA9A6inCrgxiSmfoNfLQnU0
	 k4v3fQ9vPoeWKtRedWVr864K2ctPhwlzKfkh/EoTT68y8OhwXWgmNv2HZBiNDqB7xBH4t
	 C/SQXfpaVqrwV4zVaD0G/o2FNLEFUK58NGgyTCEhZ2Bk0Tczv1s2HPunMGNGjtA1exw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795858798;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=+yvHY/srlZH50u3ozgJkZIaKzh2iY3Q8C5KA+drSbvs=;
	b=xPJ7eUtt0wdHdvN+RzMFNMvyZINcGM8foUvM3ttt1xSn+wvtyiDiEQlFhnfBj+c6KBkZ
	 fSZcHyAdwIzb5f3X7HywVDR/ttVQXCKL8+L3M44CB2JvZaxzTWMm106ezPuhLXSGFwJc5
	 YVEgMpNbikxPzjQMoI5iP34yff0Nc55dsLdqnGFDEC0CAHTDKCse6Xh+ArFlVXDg9OibY
	 mPBO2gM9rGE+hyAKrfzmFRmEIFlcSVkBYGSfZi15t0R9RKOAZLVVM9NOWfWLtWDuB7m3Z
	 Ug+Zo/BYafNBJzhXpUuCYfkCwAMSmIKX+Cagyz9BIyLnGdDUlY7Z4VX/Lxel67iyUjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mail.sdu.edu.cn;
	spf=pass smtp.mailfrom=mail.sdu.edu.cn;
	dkim=pass header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=estJGjvd;
	arc=none smtp.remote-ip=45.254.49.198
Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04E41606A321
	for <linux-sunxi@lists.linux.dev>; Sat, 28 Nov 2026 09:39:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04E41606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.sdu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=mail.sdu.edu.cn header.i=@mail.sdu.edu.cn header.a=rsa-sha256 header.s=default header.b=estJGjvd
Received: from lgs.. (unknown [101.76.249.61])
	by smtp.qiye.163.com (Hmail) with ESMTP id 5655b07be;
	Sat, 28 Nov 2026 17:39:49 +0800 (GMT+08:00)
From: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
To: emilio@elopez.com.ar,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	mripard@kernel.org,
	hansg@kernel.org,
	bbrezillon@kernel.org
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 0/3] clk: sunxi: Pair platform clock setup with teardown
Date: Sat, 28 Nov 2026 17:39:48 +0800
Message-ID: <20261128-f81b700d6c-u17-0@mail.sdu.edu.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa22186745803a1kunme5eaf005451bd2
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCSUtNVk4YSx5CT01NTUhIQ1YeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVTE1VSU9CVU1KWVdZFhoPEhUdFFlBWU9LSFVKS0lCQ0
	NMVUpLS1VLWQY+
DKIM-Signature: a=rsa-sha256;
	b=estJGjvdx7tWrwRpDY019KZme+DGgJJykCc7EuYPTYdqsumxY6UeiOEraqZ/ik2029QDDcZnLPHNmrBMwCdYRnOaVwC5U59xjqKd0CsvKO/ESQWLMTzsec/rOHeqVO1cQhPFUZ1tJe7qa76v9eFlNidqut5hItEAq9MiwOcqEuw=; c=relaxed/relaxed; s=default; d=mail.sdu.edu.cn; v=1;
	bh=+yvHY/srlZH50u3ozgJkZIaKzh2iY3Q8C5KA+drSbvs=;
	h=date:mime-version:subject:message-id:from;

Handle platform teardown for the mod0 and APB0 clocks and the APB0 gates
provider.

Guangshuo Li (3):
  clk: sunxi: Release the platform mod0 clock before unmapping it
  clk: sunxi: Unregister the A31 and A23 APB0 platform clocks
  clk: sunxi: Fix potential use-after-free of APB0 provider data

base-commit: d8f05ec001e838cdb94fc14efa7c411e676f9ab9
