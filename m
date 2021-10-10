Received: from mail-m17638.qiye.163.com (mail-m17638.qiye.163.com [59.111.176.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E504E72
	for <linux-sunxi@lists.linux.dev>; Sun, 10 Oct 2021 13:56:46 +0000 (UTC)
Received: from amadeus-VLT-WX0.lan (unknown [58.23.36.250])
	by mail-m17638.qiye.163.com (Hmail) with ESMTPA id 3B1A31C0189;
	Sun, 10 Oct 2021 21:50:42 +0800 (CST)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <mripard@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH v2 0/1] arm64: dts: allwinner: NanoPi R1S H5: Add generic compatible string for I2C EEPROM
Date: Sun, 10 Oct 2021 21:50:16 +0800
Message-Id: <20211010135017.6855-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
	kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUMZGElWTENDS0oYQhgaGk
	keVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWVVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pz46Ejo6Oj4XETcJTgFCPxw4
	CD0aCk9VSlVKTUhIQ0xIQ09JTEtDVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWU5D
	VUlIVUhNVUlOS1lXWQgBWUFJSElONwY+
X-HM-Tid: 0a7c6a7850ffd993kuws3b1a31c0189

Hi ChenYu,

> You should add the atmel compatible as a fallback one, not replace the
> microchip one.

Thanks for correcting, I did it, also upgrade the commit message.

> Please also add a cell representing the MAC address, and hook it up
> to the GMAC. You can find an example here [1].

Frankly speaking, I’m a little confused about this. There is a rtl8153
usb network card on this machine, the original factory seems to store
its mac address on this eeprom. It seems that there is no usb network
card written in dts in the kernel before, and the rtl8152 driver may
also need to be modified accordingly to support reading the mac address
from eeprom.

Sorry for my bad English.

Thanks,
Chukun

Changes from v2:
* Typo fixes for the position format.
* Add a nvmem cell representing the MAC address.

Chukun Pan (1):
  arm64: dts: allwinner: NanoPi R1S H5: Add generic compatible string
    for I2C EEPROM

 .../arm64/boot/dts/allwinner/sun50i-h5-nanopi-r1s-h5.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.17.1

