Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 560C822334
	for <linux-sunxi@lists.linux.dev>; Fri, 16 Aug 2024 00:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723767525; cv=none; b=aO1+SSIT1Tz+coN0YYINuUVl/hAfkNWsgRzjxrKuo0OLE9SSYujRilB87p1fRosJfgkoDjEIfv53K90FWWFJtNHVI3Inrm85srHii7IQMl6Wx41orulowi170CPnAXJh25MqWFAIs76JoS7hqYp4DAdmHOjHDe94BU9Pb61EcV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723767525; c=relaxed/simple;
	bh=1K1mM/fDKVg9r17+5olckVhXJre9Iv08+gafKdiuMOM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oz1YS2ypk28LikGFV+5vvA/dSVTec0eXCafJ6f6NVTqWOq/XhND6V66+2omP4+2qKtDyM5aHHDvgmWSo8JJLWj7efweC+bJo7tt/1qLtQdGuVUcI4p2KOlG+nvw0oTOiM8yqZG7nozX/2nC07HtZQoT8XKwjjLofmH6RQ4HTc2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 71BED169E;
	Thu, 15 Aug 2024 17:19:08 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99C613F6A8;
	Thu, 15 Aug 2024 17:18:40 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	Chris Morgan <macroalpha82@gmail.com>,
	John Watts <contact@jookia.org>,
	Ryan Walklin <ryan@testtoast.com>,
	Philippe Simons <simons.philippe@gmail.com>
Subject: [PATCH v3 1/3] dt-bindings: mfd: x-powers,axp152: add boost regulator
Date: Fri, 16 Aug 2024 01:18:22 +0100
Message-Id: <20240816001824.6028-2-andre.przywara@arm.com>
X-Mailer: git-send-email 2.39.4
In-Reply-To: <20240816001824.6028-1-andre.przywara@arm.com>
References: <20240816001824.6028-1-andre.przywara@arm.com>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The X-Powers AXP717 contains a boost regulator, that it meant to provide
the 5V USB VBUS voltage when the devices operates on battery.

Add the name "boost" to the regexp describing the allowed node names,
to allow the regulator to be described in the devicetree.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Acked-by: Lee Jones <lee@kernel.org>
---
 Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
index b8e8db0d58e9c..14ab367fc8871 100644
--- a/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
+++ b/Documentation/devicetree/bindings/mfd/x-powers,axp152.yaml
@@ -274,7 +274,7 @@ properties:
           Defines the work frequency of DC-DC in kHz.
 
     patternProperties:
-      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo)$":
+      "^(([a-f])?ldo[0-9]|dcdc[0-7a-e]|ldo(_|-)io(0|1)|(dc1)?sw|rtc(_|-)ldo|cpusldo|drivevbus|dc5ldo|boost)$":
         $ref: /schemas/regulator/regulator.yaml#
         type: object
         unevaluatedProperties: false
-- 
2.39.4

