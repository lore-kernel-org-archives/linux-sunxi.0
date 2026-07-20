Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E63853B6367
	for <linux-sunxi@lists.linux.dev>; Mon, 20 Jul 2026 20:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784581022; cv=none; b=kBBp3Rpd8X/NO4SKvSQpL8dWqvXelO4kEYdBNi3tKhyf+0J0z07X9rCKD4xSJYgXhKzqPmfA8ow4S0jHQ07JWIJmBIMFbtzIP693cEgjMzwFT0GMETqb/sg/XEfzseGwYJEQNycn5WogfgSdyDqPdouM6lVvs2QQVNn9/KxO5oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784581022; c=relaxed/simple;
	bh=0sf+fyuHYnaMAtA19DNDELQhufykY0EdpHdcCz+mY5E=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sYRWF76RIrz8ikdJTTBxyVzGQa+JY6a5uUWHhtzR3c5PvhurzHryDSf5IkjO163Nuc0Lwavpw22MnlaIh5UX2VhiaF00rS7Dm0cUcoFqZntuUqSBXUuA5kX9/tjW4mNsfUOkelnFKf9gmKerCPKvMThwK9ZcGeyWSaTN0N1zXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=Txr+OlWC; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="Txr+OlWC"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 089FA143D;
	Mon, 20 Jul 2026 13:56:55 -0700 (PDT)
Received: from ryzen.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 47E543F86F;
	Mon, 20 Jul 2026 13:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784581019; bh=0sf+fyuHYnaMAtA19DNDELQhufykY0EdpHdcCz+mY5E=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Txr+OlWCU4eRFFdWhfpWDvyOIGXTE6VaH2oovMfE3rYvaXCxdRyi7vq8YUyWnOKke
	 8pm9yanXgHi2g5r9fcnnBoOGust6vI1m9TPxPCzZa6aND9D51JAsd3CHZgIcL3St2i
	 ln5zfxbkd/RvZ7Dtd9JNF+IRAP5fcdoK16AMcrDI=
Date: Mon, 20 Jul 2026 22:53:10 +0200
From: Andre Przywara <andre.przywara@arm.com>
To: Justin Suess <utilityemal77@gmail.com>
Cc: Sean Young <sean@mess.org>, Mauro Carvalho Chehab <mchehab@kernel.org>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Maxime Ripard <mripard@kernel.org>,
 linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, Sashiko
 <sashiko-bot@kernel.org>
Subject: Re: [PATCH 0/4] media: rc: sunxi-cir: support the A523/H728/T527 IR
 receiver
Message-ID: <20260720225310.039aca2e@ryzen.lan>
In-Reply-To: <20260702214750.3428694-1-utilityemal77@gmail.com>
References: <20260702214750.3428694-1-utilityemal77@gmail.com>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  2 Jul 2026 17:47:46 -0400
Justin Suess <utilityemal77@gmail.com> wrote:

Hey Justin,

> This series adds support for the CIR receiver found in the Allwinner
> A523/T527/H728 family (sun55i). The only board in this family that I

will you be able to send a v2 with the fixes we discussed in this
thread? No driver changes, just the binding for the new specific
compatible string, and the DT changes.
I tested this on the X96QPro+, and also managed to enable IR operation
on the Avaota board, where it uses the other IP instance (and another
pin).

Please let us know if you can send a new version this week still, to
possibly allow a v7.3 merge. Happy to review that quickly then.
If not, please drop me a note, I can then take care of that.

Cheers,
Andre

> am in possession of that has the IR receiver is the x96qpro+, so it is
> just enabled for that board. The Avaota A1 may have it, but I don't have
> hardware to test, so it's just enabled on the x96qpro+ for now, but
> left in the a523 DTSI for future use.
> 
> The sun55i family carries a newer revision of the sunxi CIR IP that is
> not backwards-compatible with the prior hardware. So a new pulse
> capture mode field in the control register resets to 0 by default,
> which captures nothing, and the sample clock divider became selectable
> instead of the fixed module clock / 64.
> 
> Solve this by adding the two new registers, enabling the setting of the
> pulse capture mode register and the selection of the clock speed.
> 
> The new compatible is therefore added standalone, without the
> usual sun6i-a31-ir fallback (it won't work).
> 
> Tested on an X96Q Pro+ (H728) TV box with the Google TV remote that
> came in the box (using NEC keymap). Was able to press buttons and
> get readings from lirc / ir-keytable.
> 
> The series is based on tag v7.2-rc1 on mainline.
> 
> Justin Suess (4):
>   media: dt-bindings: allwinner,sun4i-a10-ir: add A523 compatible
>   media: rc: sunxi-cir: add support for the A523
>   arm64: dts: allwinner: a523: add IR receiver node
>   arm64: dts: allwinner: a523: enable IR receiver on the X96Q Pro+
> 
>  .../media/allwinner,sun4i-a10-ir.yaml         |  1 +
>  .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 19 +++++
>  .../dts/allwinner/sun55i-h728-x96qpro+.dts    |  4 +
>  drivers/media/rc/sunxi-cir.c                  | 76 +++++++++++++++----
>  4 files changed, 87 insertions(+), 13 deletions(-)
> 

