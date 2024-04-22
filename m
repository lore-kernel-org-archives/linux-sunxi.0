Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBA7B154C16
	for <linux-sunxi@lists.linux.dev>; Mon, 22 Apr 2024 16:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713804321; cv=none; b=NfaxT2Q0/bxZ7Kl7l5/qhhQGqjWdg3rUZlgvkru/hiMssC8BkMhLpWr8JnfHbwK7gTC54NTfJYJ29xfgyewEt/ffFPWnPEKkEylEzdm5NmG2fUbFi9X7H2Xk0ttQrIL8Jq29HBtpOX5TrjKSO0klGi506t6VakHn/G6bDtkX0As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713804321; c=relaxed/simple;
	bh=bDfz8x91zE22UkKEC6UGD7/fU46MiX1k/M7h9i6afrg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Jgn91xu2sdn+vVCEyPFdEj7unZSPEJ16SaTsL4FD6/FAjx4SgEAutRn8z2aPhyS75198hqX+N9JHm2gIb1+97TFu8ZlEXeZXl4rCyDSlTtpNNLZrE+Jk1MSXOBS9DepVVSEyorHMfFe/XBXHNbcUBU2AeyXOcu7rspXaTcjxTpo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 246FD339;
	Mon, 22 Apr 2024 09:45:47 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1DF253F7BD;
	Mon, 22 Apr 2024 09:45:17 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	James McGregor <jamcgregor@protonmail.com>
Subject: [PATCH 0/2] arm64: dts: allwinner: H616: Add LRADC
Date: Mon, 22 Apr 2024 17:45:09 +0100
Message-Id: <20240422164511.2488261-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: James McGregor <jamcgregor@protonmail.com>

The Allwinner H616 series of SoCs have a low-rate ADC (LRADC) with
6-bit resolution and one input channel. They're compatible with the
existing drivers, so it only needs to be enabled in the DT.

Add an LRADC node to the H616 .dtsi, so board DTs can use them by
adding 'status = "okay";'.

This was tested on an OrangePi Zero 2W by attaching an expansion board
with two key buttons connected to the LRADC, and adding them to the DT.
/dev/input/event0 then properly reported the button presses. The patches
are based off sunxi/for-next.

James McGregor (2):
  dt-bindings: input: sum4i-lradc-keys: Add H616 compatible
  ARM: dts: sun50i: Add LRADC node

 .../bindings/input/allwinner,sun4i-a10-lradc-keys.yaml |  4 +++-
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi         | 10 ++++++++++
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.34.1

