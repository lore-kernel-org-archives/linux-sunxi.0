Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35CD525524C;
	Sat, 14 Mar 2026 07:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773473434; cv=none; b=nhexMN1PPZm2W7x1gtfH7xMVWbaBnuzPgZsvWcqGhz/1NyIMyUS5gUDxufj+j1J3+JDlvB6l/2C0N0Omoo90aRLuwDpR8PaS3j3wy5hEuc2qmlkISrKB8iczARMswBKQ9GVGljGG7EyxEpS6HnL3jWsWrWjfv6kzYpH3mkct9ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773473434; c=relaxed/simple;
	bh=/r7P63vAzuId1FJu7Wx90EZmySB9sAz0wDy3fGBNv4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=crPpDA5KGwG9AjarVLZp7sWo/grg34wKuJUaYrWzZDDW9l8MVwViJCfCGnMFA4KBuj7le2iy1pPPi/RKf8Z91LDE7kcRSiEfM78fYCqy8331A6/hru5XJ7WXLk8V592JF72C97Gn1DZesBFj+NoNKDz+VAO+DjFMSL7GZVH+afM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=t60OkyTn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="t60OkyTn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 829D8C116C6;
	Sat, 14 Mar 2026 07:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773473433;
	bh=/r7P63vAzuId1FJu7Wx90EZmySB9sAz0wDy3fGBNv4E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=t60OkyTn7wfBA1/DrrMu7aRTpp4k6minF0VVXbLhFstWqShJAYlYymEnFfNx0Yo7n
	 UnwpsrP+XkzOs6EL1Qh0IktITu43JhiG27eom1zjTXorlC7hg2unAci74EFwXGkkXX
	 MRA4iEKOd0sqEdsN56ErTUHu1R6AhvzsgD7+RMwsUJh5GRZDlsCLKtBlOLwTXRuyAR
	 dQ5H6pjhEsudK2b0U4TLoKapU5/6n95yosXcg9aHic7vp1gyrT8ufPpEC+TURzN9Fd
	 ibw1mSpvyVdskSI0EM3kokAZFz2AXVNxIPu/G8+qIzLfMx9FxU2k9qlNh6GtFNynF9
	 xCzGUWFdshCvA==
From: Chen-Yu Tsai <wens@kernel.org>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, Jun Yan <jerrysteve1101@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 jernej.skrabec@gmail.com, samuel@sholland.org, mripard@kernel.org, 
 andre.przywara@arm.com
In-Reply-To: <20260304073430.438835-1-jerrysteve1101@gmail.com>
References: <20260304073430.438835-1-jerrysteve1101@gmail.com>
Subject: Re: [PATCH v4 0/3] board: sunxi: Add TaiqiCat (TQC) A01
Message-Id: <177347343121.5222.10454445952676916581.b4-ty@kernel.org>
Date: Sat, 14 Mar 2026 15:30:31 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.14.2

On Wed, 04 Mar 2026 15:34:27 +0800, Jun Yan wrote:
> This series adds support for the TaiqiCat (TQC) A01 —
> a set-top box based on the Allwinner H6 SoC.
> Originally released by Ultrapower(UQSoft) as a blockchain terminal,
> the device has been discontinued and is no longer officially
> supported.
> 
>   https://web.archive.org/web/20190409213228/https://tq.ultrapower.com.cn/product.html
> 
> [...]

Applied to sunxi/dt-for-7.1 in local tree, thanks!

[1/3] dt-bindings: vendor-prefixes: Add Beijing Ultrapower Software Co., Ltd.
      commit: b4137a75e1e611f37fcdc74c1d41696c7971e0b8
[2/3] dt-bindings: arm: sunxi: Add TaiqiCat (TQC) A01
      commit: f3208874f32c09dfc9ee330204f9fccf26e15b57
[3/3] arm64: dts: allwinner: h6: Add TaiqiCat (TQC) A01 support
      commit: b912e48bee355b6b1faf86efc4a23191324ffecb

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

