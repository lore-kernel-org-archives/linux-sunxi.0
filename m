Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91507334695;
	Mon, 27 Apr 2026 15:27:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777303677; cv=none; b=BPsxrYuVwVK/l6dWstgeQiKcw9YXAS/QmuJvz2oRdDU+lZhfLyG+2hOLMjXrRJfZn8aPx82zIhcIlCP1cS3ZSc2LmMqFyBkC420r6f33BEVQjT7lDcPP70SGGe/TquNKR878HbC7/6G0qf/cfmp2oAITh2Bl4m3gKtZO4oL9qXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777303677; c=relaxed/simple;
	bh=kZuAlP3Nr9NwZ2yzjYCg6oSkTi0vhJTtqOJ280luNbI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=V09MELdzc50JIBTEkL6eWE0KzBjKPL+1jh6vAOOo5XLozIjL+tLW/BPr79ljU80x45fsmSd1i0DlfCn4qNcEW+1eXWIHaNK6qSo90uPIUcaOsHaCOAlDDcmbCcLcyysb9SP4vfLILQ3TLOZUMlh53QKajF4CKc4a5OCmrD5lAKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BpV+2Zm5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BpV+2Zm5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73360C19425;
	Mon, 27 Apr 2026 15:27:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777303677;
	bh=kZuAlP3Nr9NwZ2yzjYCg6oSkTi0vhJTtqOJ280luNbI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=BpV+2Zm5Pm4O+AF5uQ263C+7+iiIt0dmeth3oLzNyLVtKNWDk9uaQl3eMJ3uWBzwI
	 wdaJzdzXQiIg3lalSrc6BOYtuubnyL7EYt4KrE2lkHUIVkG6wrOu99QsjnQrJHDW2M
	 nXx6BzRa4Sne14Fx0ifIM9D6G+HMfT/4tNFB0MOlCSqCabgERNo7FI3/cbbfl7plZP
	 LctWmDmtkoz3xsGpDY/0x3U6IJ0nRXmSDCUmVhYJqhqM7/tMhjVN58luCeZYYfIQbe
	 PWDsSnPbGwhlo4r2zX/9B/AXs2zRwWkAfkcmTVHCZMEK19Lpm5Y3iuFKtczaYeTIcA
	 YaBXUAv5peQZA==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jernej Skrabec <jernej@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, Chen-Yu Tsai <wens@kernel.org>
Cc: devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260324164357.1607247-1-wens@kernel.org>
References: <20260324164357.1607247-1-wens@kernel.org>
Subject: Re: (subset) [PATCH 0/7] soc: sunxi: sram: Add H616 SRAM support
Message-Id: <177730367517.346804.17043761045926586221.b4-ty@kernel.org>
Date: Mon, 27 Apr 2026 23:27:55 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Wed, 25 Mar 2026 00:43:48 +0800, Chen-Yu Tsai wrote:
> The Allwinner H616 has two switchable peripheral SRAM regions:
> 
> - The VE SRAM is a 2 MB dedicated SRAM for the Video Engine. CPU access
>   to this region is enabled by default. CPU access can be disabled,
>   after which reads will show the same stale value for all addresses,
>   while writes are ignored.
> 
> [...]

Applied to sunxi/drivers-for-7.2 in local tree, thanks!

[7/7] arm64: dts: allwinner: sun50i-h616: Add SRAM nodes
      (no commit info)

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

