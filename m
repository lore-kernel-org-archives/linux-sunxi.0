Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E310944E665;
	Tue, 28 Jul 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785249661; cv=none; b=CUIpExnjLnUctIYebndAEGlA/CFNBo4Nf9/ZeBBsIfgPG9YQaYVi9lgCSLunjN5fpz8B3wqni+ek+YmEOR/5Iwmcrhsop5YhOuAdvsZId/hgoTc5wjcccSDgvOAv8GHL+RiVUv9BG2pY0yhO5zEUuyKxZbDtg2rH97FvI3Z8UAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785249661; c=relaxed/simple;
	bh=Sk6hZbKEn31HOHUZFBs6Dq5PliAL0xK4k6VTVCy9LMg=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=A5ilnK3a+75goRkIIp/pfQuwP3oda6b9ujyFqYtuMgWsrg/vlrgOpnhzz/eX98b/cvrcNUlw73nvtDqhBjWs8mjMDwaNWXz9f9iZsVGl5CiBamsytNfXnPiu4mSPgbOoZFDK41ss+Vsbr2AGCHJ0btI5/7759aAuWGyFRXnrXz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OpDDGcwd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OpDDGcwd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A73981F00A3F;
	Tue, 28 Jul 2026 14:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249659;
	bh=5SyQBSt2UdaYBX5LG330Ku8SMsXEvIX312QVbqRgjBM=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=OpDDGcwdlCLdwrY9O0W4rCrBXN90iNw7yj0+9SNU5XIKbNUcmJ978Xb0DuAVdO4i4
	 4WGZOQuGzMiMbXQ6q6PGwQFaBYBt/t4GkHw6nFMBNn+FtoIGO5Fc7L/QzOlfM5w3AY
	 ctjQWeDn9xjhfQWAwFFJ/JagA/bKmWZurnAx7TTKhS9qRI+373Tww0ynzr+rY8841V
	 EIBQSuK3eyenw+fKVA/6EWuSPDifs+92S6EvPNIDjv7EMAE8n384NLw4gk5gdPuHer
	 HVLxK2L9QUpMBc4cMQhH2okuYh3aHc6TUSTEpNC71zHRTTQjmFCYoWGYqPzv3OX6MB
	 enER5CrC7dKIQ==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Per Larsson <per@palvencia.se>
In-Reply-To: <20260720174253.7686-1-per@palvencia.se>
References: <20260720174253.7686-1-per@palvencia.se>
Subject: Re: [PATCH 1/2] arm64: dts: allwinner: a523: Add missing SPDIF pin
Message-Id: <178524965743.668575.17658013610158209404.b4-ty@kernel.org>
Date: Tue, 28 Jul 2026 22:40:57 +0800
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2

On Mon, 20 Jul 2026 19:42:42 +0200, Per Larsson wrote:
> When spdif support was added for the Allwinner A523 family of SoCs, only
> two of the three possible pins were added to the dtsi, since the third
> would clash with the first ethernet port (emac0)
> However, some devices don't use emac0 and instead use emac1 for the only
> available ethernet port, leaving the pin free to use for spdif.
> 
> Add the missing pin to the dtsi so such devices can (later) use it
> 
> [...]

Applied to sunxi/dt-for-7.3 in sunxi, thanks!

[1/2] arm64: dts: allwinner: a523: Add missing SPDIF pin
      https://git.kernel.org/sunxi/linux/c/3683d4f690b8
[2/2] arm64: dts: allwinner: a523: Add SPDIF to x96qpro+ device
      https://git.kernel.org/sunxi/linux/c/35ab38054011

Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>

