Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDFE8539D
	for <linux-sunxi@lists.linux.dev>; Thu, 20 Apr 2023 10:24:44 +0000 (UTC)
Received: from debian-test.local.in-circuit.de ([84.160.205.173]) by
 mrelayeu.kundenserver.de (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1M2ep5-1pt1pY1Ztv-004DKE; Thu, 20 Apr 2023 12:24:23 +0200
From: Ludwig Kormann <ludwig.kormann@in-circuit.de>
To: samuel@sholland.org,
	jernej.skrabec@gmail.com,
	wens@csie.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	andre.przywara@arm.com
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: arm: sunxi: add ICnova A20 ADB4006 binding
Date: Thu, 20 Apr 2023 12:24:08 +0200
Message-Id: <20230420102409.1394618-2-ludwig.kormann@in-circuit.de>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230420102409.1394618-1-ludwig.kormann@in-circuit.de>
References: <20230420102409.1394618-1-ludwig.kormann@in-circuit.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pl4wWMFhhwVqCOS52QAmHuK+7lZMDuokr64cczEZgQbo559rx6Z
 A+laCnHe4Yk4MRodEGZmdIIXnsdlc2J+o+NNmPP2e9mxxUU0G4xBDZ/Is66RDMrg6otAR1R
 sGk0pvpfxFhDFPUAp2Ym5SWw2AINAQwnORq2QAEdwVm9Jl/syeUmvhL7h6m8Oh/dbUxLSi3
 j2dQDzVoRV6SUqpX2XSNQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:Umu3DpUi9po=;gsg67P5HsflTLc2Y+N1wz/X07ri
 UazckAMqQiE385HVpo74CIyqlM0KOsOoFXeVMhHFs2dBBrlLFQyOxAJM1hK92Omvv6ON7XmDY
 xvo5omNMuKspu0a59BC6URzox5kKBVuCHLzxJEkVPKRoMHior8E/s9/CSbB/wtbKuAPqk4uFt
 YcTiW39/9wJ5EIMcocu2KV75nUeqQBhA5JI0hr/t5BQ3VVoYbt6lzsdoWtHp8+QNDxLIM/Ncd
 Sxs2yuaT9TmNgdYmyUnX2VZdEEI5ZfFTS3Hnld52cKSsaQNr6FQ7DApHT46q/hOP1KkHQsSMY
 WiBDI40vwKI1HQMJAwdyguse5clQ3R/DhAVuoYoV977+5TMiDIUuSk1WJhaCIiBKkOT/hRRXM
 EF96rpU77wlqwI4ZlPSYh5gWO6FGitjrL274yw1nrE3BPjcKTLNO0z8ixsfmmct1DuS8O/YfJ
 lfJ894dZy/2/UE8TVCYRiEhk1VzJ5DqTMR/nzEEai3/3Xyo4MqIHmEbX8gGE9/pToxW9xnw3B
 vbw6NtOuzBrd+os/A2CKgCwsAQRlBAFIos7zOTSq7/Xeu1AczCe+V3sGG+ENB5mEvXbw3HdI4
 uHT9yO9RSOyd3BYnuy3Qx2x5rLmLPk7DnVL7Xn9cmkuEcAy7UWL9RXGZrjWx2yKliW8wes24z
 V8PHJ0aAR3tgEN/7smkhvXkkR+/7mo+YOTIcH6EgbA==

Document board compatible names for In-Circuit ICnova A20 ADB4006
development board.

Reviewed-by: Andre Przywara <andre.przywara@arm.com>
Signed-off-by: Ludwig Kormann <ludwig.kormann@in-circuit.de>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index 013821f4a7b8..ee8fdd2da869 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -305,6 +305,12 @@ properties:
           - const: allwinner,i12-tvbox
           - const: allwinner,sun7i-a20
 
+      - description: ICnova A20 ADB4006
+        items:
+          - const: incircuit,icnova-a20-adb4006
+          - const: incircuit,icnova-a20
+          - const: allwinner,sun7i-a20
+
       - description: ICNova A20 SWAC
         items:
           - const: incircuit,icnova-a20-swac
-- 
2.30.2

