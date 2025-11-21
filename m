Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C99214A8B;
	Fri, 21 Nov 2025 02:58:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763693919; cv=none; b=Eru4TQeLX6fR9vRWkpgFK4G+a+6ltM/zGA388qHieR/3kvyqI//aENfpdIB2fgBzDKxkJn+tVZXyWqilR9pp03e3iupE9vdG9ccBtzpfQTwz2fpV3hnYwDKU1cDFHTRMRSMidHhEq1Fwpozwfby3W+JmpwtfpVHA5qqarm0kTT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763693919; c=relaxed/simple;
	bh=1bNQbwHrYuW7HQk1KCxPp9vMuOHIa6T5fJNOx6hn+Is=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Vk3lR6eOD8Od1gMHlN0+hkhbyPOfvQhPVsIX1L+E2zQJiDeJ937FJTRRyZOWxqa8xO4uLvOutcSCDfLRpVdxGXpieIMitlaCFa+sU0RPhPjTKZDfsOGcOLNnlyBf4YUSs32N5SlGNjlZFQRsOBw8YAXxlUjOy/EvRFQOM54wZZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bWhS1yRE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bWhS1yRE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1E1FC4CEF1;
	Fri, 21 Nov 2025 02:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763693918;
	bh=1bNQbwHrYuW7HQk1KCxPp9vMuOHIa6T5fJNOx6hn+Is=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=bWhS1yRElPkMGupvWAWEtHGTKAlv3U7wwvmZrbmiCJXyJyrDJCihpr+9pEtMAmErC
	 6sNYVR/LwDIRLwJgLQ6SeitmYMxcHzqGUfbq2KZ0BOCr6cQoCfl3azk03GdswQkxem
	 9pTvPVXW1dwTMGPysxIjc+DEGoOC5W++xXu7kGuuOBx7vvKbwpyxNH4matqfkfBCua
	 GEVJ2/uWQ1zFoWXuoo23ouimtm7VgaeMMwXXhm2Y3KVs7AaA8JvZioIe0rLiqff7dN
	 M4/BbzXQS/wluBuMvJXNbl5eVlzqhHmvJDG01OBirplPk39nahRHEpsY7/2gWiPPWE
	 Je7X0KhgLpYmA==
Received: from wens.tw (localhost [127.0.0.1])
	by wens.tw (Postfix) with ESMTP id E67465FDB4;
	Fri, 21 Nov 2025 10:58:35 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Charlie Jenkins <charlie@rivosinc.com>
In-Reply-To: <20251119203508.1032716-1-geomatsi@gmail.com>
References: <20251119203508.1032716-1-geomatsi@gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: fix vlenb property
Message-Id: <176369391591.4121578.8100709414179507629.b4-ty@kernel.org>
Date: Fri, 21 Nov 2025 10:58:35 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3

On Wed, 19 Nov 2025 23:35:06 +0300, Sergey Matyukevich wrote:
> According to [1], the C906 vector registers are 128 bits wide.
> The 'thead,vlenb' property specifies the vector register length
> in bytes, so its value must be set to 16.
> 
> [1] https://dl.linux-sunxi.org/D1/Xuantie_C906_R1S0_User_Manual.pdf
> 
> 
> [...]

Applied to sunxi/fixes-for-6.18 in local tree, thanks!

[1/1] riscv: dts: allwinner: d1: fix vlenb property
      commit: 57c5543b94d0c0280145a4a7445a2c1ae074879e

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

