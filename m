Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795191088;
	b=TVgfTY7tAEc6Wavwg3yWs0OrQcjNtv7UFL391UsMwx387kW4hLwVRH89EGetylxaynBj
	 KHOc/5hXx7BYdEf5XzVZRMZgbshRtVl8to2xFR2h1LU9tNC03wxPJdbM2v4rEHEvKUisU
	 UA52JvjqAhcCuG916d5HMX2uha634/7vQOASpHIfBycJV1wqO0PtojqYmrq+BdslkOrB5
	 f9NStLfoT58xEDTat6oaQE0WyP4sPAt7DX/GYZIzc4ZFzev/hThg+uTXeZUNAdxNEy7W/
	 sVu8bgOPilJMDGR/Vd6+RKqiNopq5LWg8V2ed6jbkZcFEyPnOaEBqt0qu51SizC+5aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795191088;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Meq83XA2zkquAPWRzQKQaEYw0Hcq8v+No+VZx0vwCJA=;
	b=YSs2ceDoetzdZA15fppG/Qf+sSSWuvCX4RSxRkyDjHmNX6h8sHQfZLuzMD4e2pDCyuMY
	 hhiNUGYMEerptvUWuc+D0FOn574N01xiWoHXztUTtkGAJXcNLpWi4kqBL7JzY6DxZZ1X6
	 TaDVSu+Dv2cpp8TBq08AHC7QUEUA8ul5UR9vSBGaqt2EdWrxszY+86c8g9i2Xg37PTRgf
	 AzieLmyrxv6I6/aot1kPcFWDfPmIQNWwX3BJU67lafV3IdfQBhexA8r/8csgXpf1D9J1+
	 TE+KBS1I1T1dpmPD66RfEIz8ZfE+bdtfhlvwf3W/3vjkVmEonl+x5x22iHELTYqHvLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCRbOn1R;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09094606A32C;
	Fri, 20 Nov 2026 16:11:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MCRbOn1R
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB6181F000D0;
	Fri, 20 Nov 2026 16:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795191087;
	bh=Meq83XA2zkquAPWRzQKQaEYw0Hcq8v+No+VZx0vwCJA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MCRbOn1RGGQ8XAUyxWAIdk5NonKAE8ZsEjgzRbOCbWVa45iSDkBBGXhgEfmw6yL9R
	 eDAJHz7smhUPwkVzwg2IO3bf/fZZBp5m7+BJW4GM6MHAa4G3bOVElY6Y8E6JVD0xLg
	 uSHWHEK5zDJnI3nIdq0oHJRNvcM4W7fsTyG6gj42u3DqMUPKl7kgw2kErw/ADVmQV8
	 x6JGr66+TjvG8hNn0+P4of4vkyihT587C8Srv0/ycSr+5wj92zjt0iayPwIZZAgdxl
	 4TyEgg1vYmSJtP7+ulo8uBuJSVqIH5qIq+7jxVkU+kyNTY3dIotos/3sYkZ9F7fwp0
	 8LrISKPBsTbog==
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Ivan Pfarher <ipfarher@gmail.com>
Cc: Chen-Yu Tsai <wens@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: Re: (subset) [PATCH 0/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Fix Bluetooth and USB gadget
Date: Sat, 21 Nov 2026 00:11:18 +0800
Message-ID: <179519098349.916385.12962911219615170069.b4-ty@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
References: <20261120-orangepi-zero-plus2-fixes-v1-0-ecd792189f27@gmail.com>
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Post: <mailto:linux-sunxi@lists.linux.dev>
List-Help: <mailto:linux-sunxi+help@lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-sunxi+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 20 Nov 2026 12:40:44 +0100, Ivan Pfarher wrote:
> On the Orange Pi Zero Plus2 (H5), neither the Bluetooth part of the
> AP6212 module nor the micro USB port in peripheral mode work with the
> current device tree. This series fixes both and adds MMC aliases:
> 
> 1. The AP6212 needs the RTC 32.768 kHz clock (osc32k-out) as LPO. It
>    is not referenced, so it gets disabled as unused, and the BT ROM
>    then answers nothing but HCI_Reset.
> 2. Describe the Bluetooth controller on UART1 (BT_REG_ON on PA10), so
>    hci_bcm can power it, load its firmware and use it at 1.5 Mbaud.
> 3. EHCI0/OHCI0 share USB PHY 0 with the MUSB controller. When they
>    register, the USB core switches the PHY to host mode, so the
>    peripheral-only micro USB port never enumerates as a gadget. Drop
>    them, as the port cannot supply VBUS anyway.
> 4. Add MMC aliases so the microSD card and the eMMC keep fixed numbers.
> 
> [...]

Applied to sunxi/dt-for-7.5 in sunxi, thanks!

[1/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Add LPO clock for AP6212
      https://git.kernel.org/sunxi/linux/c/bfa27cff7430
[3/4] arm64: dts: allwinner: h5: orangepi-zero-plus2: Fix USB peripheral mode
      https://git.kernel.org/sunxi/linux/c/4fb04f870eb6

I changed the subject for this patch to "Disable USB hosts".


Best regards,
-- 
Chen-Yu Tsai <wens@kernel.org>
