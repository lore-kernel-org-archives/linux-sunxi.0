Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1921372692;
	Sun, 29 Mar 2026 13:22:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774790569; cv=none; b=S8aNebVLsVgfMQaLzWtscs64aeIM6G2kZh9te8+Ujgr7HSs89cPxXT9o7dOymMjOrB2XnEM7cVsltTTlNZMgl4QtfOsWlo9Gt5kjDLImkVFZCJDFiwX2uf6adKBax/mvNbuQQxPJhJnwjGJL37mRhaHE+2ODBJPZ8hCnxEENKOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774790569; c=relaxed/simple;
	bh=BoDuH3kwc9HtdZAeOJWHQn5qzdnPMryGq5rPy9i2YGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=qr25iTx6GSSZfdI1D0hhpC0qDwOf3X4Bf50vz1kv5Uhuko83WBjG6LsHhyqNYtk578ewJYin+ooiUweRRIsFUBrIRsBt42vjhdtLbOE0PBfnD4CFkWSafXzvDX60FjfMEEhPKldepDYWAgh95anUTnGL2USSMbsk9ahOG1kYAcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PAtJFWNG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PAtJFWNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02E51C116C6;
	Sun, 29 Mar 2026 13:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774790569;
	bh=BoDuH3kwc9HtdZAeOJWHQn5qzdnPMryGq5rPy9i2YGA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PAtJFWNGvuUNWYYK67pOu1ueKBBJMkcJrDnhO9KdzSZrOZPP19aIdrhgTxnkopXnt
	 aUoLTmXKyCB4DVIRoh2eKKTfPoRSTgV/76YZc6KrVWXf5ayRwinbdgyofrmn5XgbQ8
	 Dh8rWeISDsMvnbREPqvnQzPyr8pq8XhjArloiRN0LmJEdlcbSG0/go0WQiDyPgEBfq
	 LZyn8tVx2WD41A6p+oprE5RwA2bTkQjMbBhXYhdhiHdgU9Q9jKVLW1tCgzoAD4Xj73
	 chBJZxCdRdYlkGnzs6LMfQwjaYSAZFUlxWACjHcfKp0UsyOYhKiBJVdCsaS4PG9TT/
	 bdoImMPace2Vw==
From: Chen-Yu Tsai <wens@kernel.org>
To: Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324161930.1602083-1-wens@kernel.org>
References: <20260324161930.1602083-1-wens@kernel.org>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: sun50i-a64: add UART DMA
 channels
Message-Id: <177479056775.84952.18274647332056749333.b4-ty@kernel.org>
Date: Sun, 29 Mar 2026 21:22:47 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 25 Mar 2026 00:19:28 +0800, Chen-Yu Tsai wrote:
> All the UARTs support DMA and are hooked up to the DMA controller.
> 
> Add the DMA channels for the UARTs
> 
> 

Applied to sunxi/dt-for-7.1 in local tree, thanks!

[1/2] arm64: dts: allwinner: sun50i-a64: add UART DMA channels
      commit: 1e80a0367bca7ffe3dfff41948474fe3c3ad3587
[2/2] arm64: dts: allwinner: sun50i-h6: add UART DMA channels
      commit: 2e4858d2f027080827c5fc557306a06fbfcecd0a

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

