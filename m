Received: from cstnet.cn (smtp81.cstnet.cn [159.226.251.81])
	(using TLSv1.2 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428C2356BA
	for <linux-sunxi@lists.linux.dev>; Sat,  8 Nov 2025 08:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.226.251.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762590079; cv=none; b=pkvdKhnL45YjfGsKQ4LHUXWE0h9fxtITj0V6xAdV1SqPqUqM67xsWkb0YWiJzAcwVU3A2owUWxmBAom/RCLknQzJwcZ6TodKQC4PiI/bcj532VDk+dsaxD4idCmcKKzPJ56FNjwr+SHVZKWRvf+86greOimvagMFZ9zoBcrTjJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762590079; c=relaxed/simple;
	bh=XuwFiFrCJm/RwOPyPBr9In23/UjXiwSUvAke7fkqAJI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fGCzVrVp9N+ReSWq9ptRNSGSJI0gFrZXcTF5iw/2eqYp5wsyeuvLblRszwGL20mG1rFa3at7NFNz2KHpryZJlOxhmyLAxDT4T1CqfD1y9NIl3WJjXeScTu2gUOsaNUDJme66F43AkiJRsruvy73GasDGBD6aKTGGwXjlYTrkT9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn; spf=pass smtp.mailfrom=iscas.ac.cn; arc=none smtp.client-ip=159.226.251.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iscas.ac.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iscas.ac.cn
Received: from localhost.localdomain (unknown [223.166.92.44])
	by APP-03 (Coremail) with SMTP id rQCowAA3texL_Q5p20b2AQ--.57722S2;
	Sat, 08 Nov 2025 16:20:36 +0800 (CST)
From: gaohan@iscas.ac.cn
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yixun Lan <dlan@gentoo.org>,
	Drew Fustini <fustini@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Guodong Xu <guodong@riscstar.com>,
	Haylen Chu <heylenay@4d2.org>,
	Joel Stanley <joel@jms.id.au>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Han Gao <rabenda.cn@gmail.com>
Subject: [PATCH 0/3] riscv: soc: re-organized allwinner
Date: Sat,  8 Nov 2025 16:20:22 +0800
Message-ID: <cover.1762588494.git.gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:rQCowAA3texL_Q5p20b2AQ--.57722S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
	VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUUYC7AC8VAFwI0_Xr0_Wr1l1xkIjI8I6I8E
	6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28Cjx
	kF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW8JVW5JwA2z4x0Y4vE2Ix0cI8I
	cVCY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2js
	IEc7CjxVAFwI0_Cr1j6rxdM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE
	6c02F40Ex7xfMcIj6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72
	CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7
	M4IIrI8v6xkF7I0E8cxan2IY04v7M4kE6xkIj40Ew7xC0wCF04k20xvY0x0EwIxGrwCF54
	CYxVCY1x0262kKe7AKxVW8ZVWrXwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E
	14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIx
	kGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAF
	wI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r
	4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0JUJManU
	UUUU=
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/

From: Han Gao <gaohan@iscas.ac.cn>

Allwinner currently offers d1(s)/v821/v861/v881 on RISC-V,
using different IPs.

d1(s): Xuantie C906
v821: Andes A27 + XuanTie E907
v861/v881: XuanTie C907

Han Gao (3):
  riscv: soc: re-organized allwinner menu
  riscv: soc: allwinner: d1: use the ARCH_SUNXI_XUANTIE
  riscv: defconfig: enable SUNXI_XUANTIE and SUNXI_ANDES

 arch/riscv/Kconfig.socs                | 22 +++++++++++++++++-----
 arch/riscv/boot/dts/allwinner/Makefile | 20 ++++++++++----------
 arch/riscv/configs/defconfig           |  2 ++
 3 files changed, 29 insertions(+), 15 deletions(-)

-- 
2.47.3

