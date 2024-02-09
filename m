Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67E6D36113
	for <linux-sunxi@lists.linux.dev>; Fri,  9 Feb 2024 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707479893; cv=none; b=ckEv9Nr13ZvTgps5683//mukrrHiKcnB3Mko5HltSL1A+lQuC656/Xa1yyIvMaWsZR8hWYbPxPXF9eCxjXD1O8UDyOB2nK8R+e7ddBh/22k8rgBQ0zSgoDh/RvQKwkxZT6LLpVlSMT/YgcFew7w0VolS2IsPW9RDSEyPsHBxBvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707479893; c=relaxed/simple;
	bh=jCDRhO1dRvuQPIDXH/X1mUzczbszngS3rdBRb/Z98FQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jC08sqJu8fRdsmSzbz4321+Z/VOakgKkp+2eJ7++Bb6MhHxD/nOophdNu6Xu6JL7wnSrL8A2l+HjOIcpRaD7ILlxkGloii4o/Tp0a73lZCxI/DJLhZHaD4Dg9MgLW8SD0ZGcuEQMAKGu7JIVtsIZ3eGaVw6kLHXmOZjELrfLdNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0658DA7;
	Fri,  9 Feb 2024 03:58:46 -0800 (PST)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2167F3F5A1;
	Fri,  9 Feb 2024 03:58:03 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Nick Alilovic <nickalilovic@gmail.com>
Subject: [PATCH v2 0/2]  arm64: dts: allwinner: Add Transpeed WiFi nodes
Date: Fri,  9 Feb 2024 11:57:57 +0000
Message-Id: <20240209115759.3582869-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

a tiny update, see below for the changelog.
======================================

This adds the WiFi DT nodes for the Transpeed 8K618T TV box. It uses a
Murata module with a Broadcom 4335 chip, which works fine with the
mainline Linux driver, given you provide the proper firmware files. We
found some in some LibreELEC repository.

Patch 1 adds the pinctrl node for the 32KHz clock fanout pin, patch 2
adds the actual SDIO WiFi node.

Please have a look!

Cheers,
Andre

Changelog v1 .. v2:
- add /omit-if-no-ref/ tag for clock fanout pin node
- update commit message to avoid mentioning Linux or driver

Andre Przywara (2):
  arm64: dts: allwinner: h616: Add 32K fanout pin
  arm64: dts: allwinner: Transpeed 8K618-T: add WiFi nodes

 .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  6 +++++
 .../sun50i-h618-transpeed-8k618-t.dts         | 23 +++++++++++++++++++
 2 files changed, 29 insertions(+)

-- 
2.25.1

