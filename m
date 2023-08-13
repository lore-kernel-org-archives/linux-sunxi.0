Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFAB62C9D
	for <linux-sunxi@lists.linux.dev>; Sun, 13 Aug 2023 12:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B96DC433C8;
	Sun, 13 Aug 2023 12:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1691930971;
	bh=BYexDixxqUqkU/OW4CfXRghNk+OuJSdJWWSfKlrybdU=;
	h=Date:From:List-Id:To:Cc:Subject:From;
	b=bLQ6q06nMkeeutsqchY0SxI7Ergt7rCQrKi3JIeY1thCkm/F0NnLvsoFqGjrnkPg6
	 IKpvRPEAdaOPjyLcfhi+fNMm/sOlxjfUaK9gwKeZGs7AHs1bb+APHF3DfvfmjjsB0x
	 Ih5iAk7aKgroTIBYN7Jqun12nhNNGXo7JxY3JwtqxBWuDj/5sWM7Z0PIuUPkhQJ53Z
	 Lhb6cd2+MwWVYTZ/NT9Cyr7qNFVdg81AzT3eU3F9D6/T0QPKHZVVxKGJTZgGuKQdkN
	 j1s2AZFhbz2Y4MbUk7G1iwG/WNbWCCMD4CuSG+ziiUIhzuf6/Irgs595awP4bG7ENI
	 oE0X4l5aMd8kQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 09F745F9B4; Sun, 13 Aug 2023 20:49:28 +0800 (CST)
Date: Sun, 13 Aug 2023 20:49:27 +0800
From: Chen-Yu Tsai <wens@kernel.org>
List-Id: <soc.lore.kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner device tree changes for 6.6 - part 2
Message-ID: <ZNjRV0kJ7v7+DAH5@wens.tw>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

Please pull an additional patch that we'd like included for the v6.6
cycle. This pull request stacks on top of the previous one sent by Jernej
last week.

FYI my GPG key expired and was only just renewed. You will have to fetch
the updated key from either keys.openpgp.org or keyserver.ubuntu.com.


Thanks
ChenYu


The following changes since commit 0801a3a9f35854c91f1f3ab8e879c3d14912d214:

  arm: dts: Enable device-tree overlay support for sun8i-h3 pi devices (2023-08-06 13:56:55 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.6-2

for you to fetch changes up to f05af44f691351bfd954f39ec376666dc5e1b869:

  riscv: dts: allwinner: d1: Add CAN controller nodes (2023-08-13 14:12:35 +0800)

----------------------------------------------------------------
- Add D1 CAN controller nodes

----------------------------------------------------------------
John Watts (1):
      riscv: dts: allwinner: d1: Add CAN controller nodes

 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi | 34 +++++++++++++++++++++++
 1 file changed, 34 insertions(+)
