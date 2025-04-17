Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 736FB8F64
	for <linux-sunxi@lists.linux.dev>; Thu, 17 Apr 2025 00:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744848399; cv=none; b=Wf0pzbgz9DWswcik7KpaA5tUIu/NHHIGPMgHhel+KxdyGSF7RAFf7cNlwWvYz/r6BQPeoiIO7ifOYKwo/PEqdgA3Eoepy5zXZz4cw7fdrz91v+EHVdWrHQG4YZuFjV7HZPKj1vbtrcYb5vrkSHP1fUSKMiQr0XlkW+UoM9QZGYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744848399; c=relaxed/simple;
	bh=f4A5PrJngWiZhrgTQs0iYjJPBKD2kTKqOYgFNktrUB0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t1qi2fwG/mnn+sfob35gBRXn9E8MxuNCGZgS70hKTzv/dgWLdh4Xp+jhBlLCu5LgBsKXkYKr1rLcEnQmn6tX7dUIr4pdib30ibjMrdzO1sPzzZheZiQKTHG2Y16SpfZFH+9HA37V0sLsXtEUKWAUDNBy24L8puECCRBSoNPUiAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5771F153B;
	Wed, 16 Apr 2025 17:06:33 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 894A43F66E;
	Wed, 16 Apr 2025 17:06:34 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Jagan Teki <jagan@amarulasolutions.com>,
	u-boot@lists.denx.de
Cc: Yixun Lan <dlan@gentoo.org>,
	Tom Rini <trini@konsulko.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/3] sunxi: fix return_to_fel() prototype
Date: Thu, 17 Apr 2025 01:05:37 +0100
Message-ID: <20250417000539.3709-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250417000539.3709-1-andre.przywara@arm.com>
References: <20250417000539.3709-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some sys_proto header file we describe the prototype of the
return_to_fel() function, which is implemented in assembly.
The order of the arguments listed there is wrong: the stack pointer is
expected in r0/w0, and the return address in r1/w1.

Fix the order to match the code. This is purely cosmetic, as the callers
and the assembly code are already agreeing on this.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm/include/asm/arch-sunxi/sys_proto.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/include/asm/arch-sunxi/sys_proto.h b/arch/arm/include/asm/arch-sunxi/sys_proto.h
index 92c7721a530..43ee0fdd558 100644
--- a/arch/arm/include/asm/arch-sunxi/sys_proto.h
+++ b/arch/arm/include/asm/arch-sunxi/sys_proto.h
@@ -17,10 +17,10 @@ void sdelay(unsigned long);
  * This returns back into the BROM after U-Boot SPL has performed its initial
  * init. It uses the provided lr and sp to do so.
  *
- * @lr:		BROM link register value (return address)
  * @sp:		BROM stack pointer
+ * @lr:		BROM link register value (return address)
  */
-void return_to_fel(uint32_t lr, uint32_t sp);
+void return_to_fel(uint32_t sp, uint32_t lr);
 
 /* Board / SoC level designware gmac init */
 #if !defined CONFIG_XPL_BUILD && defined CONFIG_SUN7I_GMAC
-- 
2.46.3

