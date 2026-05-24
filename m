Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA6E2EA754;
	Sun, 24 May 2026 22:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779662313; cv=none; b=rQsUp6uKMo5a0NKWj7oNz0+H+BM+OMcX2mvPieCtRdztQjKyFYdkcul/JRPHUl9EDfVjRT/kUw4h/Mp9TBJF+Dh0ic9gZ8wDERM6YgvFn9vSm+FgkWXyMQJt8Q4ugqFuu0NrnnIbYIDucRFebzNIlnMa1jnaLEpO5oh4R6vXjZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779662313; c=relaxed/simple;
	bh=xKUYj4yzdB/0o7DIgT/4yNYpy+sKFHch32XuUFbC+AI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=XoQOuPw8x4b7X450iD1NHLfbKbTZAwgpLxuB3e20AOqnsFujFdxe4m1fpxIqI43BaZdJa1S21a8mEdog6MSiaj76RrgqRqfCchsve7cgBT1iv/sTGnFHbVQ1Ak9xRRHV2E8ZfAqY6ip7pfsL1vBXH5k0jVotUvTlkS/H4JZ/qR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DhqcqBuT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DhqcqBuT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC191F000E9;
	Sun, 24 May 2026 22:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779662312;
	bh=QPb55gSnDR8xwX9KH2gBT4f2QQLkB8HYg5P/YhSOLLM=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=DhqcqBuTLBEMuc4Li00AWqaGX7FG08Ds+3muLlOdLamOoabFkUWkwGhYOGUj3kUy8
	 XZyT57d0yUL+hDGmqLPbUdrbORBiJd2b3RuiBdHF3xQKCoLdSzehZ9Skx9QCrmMNmT
	 BIcQunsXWUjUeSfaOFpLawv0w3PeM3xZYV7WEd9wknfOvJX12+1abUSP0SVdggjumG
	 aPFZAiPWmV5M6Rgf/OravI6XH7LwWw2As3Za7fQp9DqV34/7K8mTl0HSIA68dT/1Xr
	 M8LsAjLWuV4I1nsBj7zn7BILvLH0kfJQWOpSTbykShhCpahkBGsIFq13LrcNqbN7k/
	 gzsvYH+XEM3vw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chen-Yu Tsai <wens@kernel.org>,
	Andrey Skvortsov <andrej.skvortzov@gmail.com>
Subject: Re: [PATCH] bus: sunxi-rsb: Always check register address validity
Date: Mon, 25 May 2026 06:38:23 +0800
Message-ID: <177966228131.169428.14889058847784781615.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
References: <20260301144939.1832806-1-andrej.skvortzov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Sun, 01 Mar 2026 17:49:39 +0300, Andrey Skvortsov wrote:
> The register address was already validated for read operations in
> regmap_sunxi_rsb_reg_read before being truncated to a u8. Write operations
> have the same set of possible addresses, and the address is being truncated
> from u32 to u8 here as well, so the same check is needed.
> 
> 

Remerged for 7.2 instead.

Applied to sunxi/drivers-for-7.2 in sunxi, thanks!

[1/1] bus: sunxi-rsb: Always check register address validity
      https://git.kernel.org/sunxi/linux/c/61192938a587

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>
