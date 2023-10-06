Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE13520F7
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Oct 2023 09:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=julian.ribbeck@gmx.de header.b="XfDhbIpW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1696582973; x=1697187773; i=julian.ribbeck@gmx.de;
 bh=bC983lG28ckhgdb284kkMkUVerGEcXzknlNmQS+eYBg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XfDhbIpW5JYb4trxmD0YkwwQqSDSzjx46WleaP2EpMfyWtRAmdUbrA2saVaREH4uPTBOTBSwGc9
 G+SGT1ffOSVJ3Wp4dPeUjTh8OlJVd0pAURobWZhDkyqlT83cUPdF7g1vUc5rGj4qdq1KnnWNj/3C/
 lpdApfqwpaOnjVzNpvcUG9Fjgq6qHyb3TPOHKazpm3jT7lkFV1NkBNQgJcxyAgrAwz9KIOIoaKuTm
 AjaT8W/UyPQwlhJKrliB5GpbZFIGSH2gt86W9PA59UchSUJ04hBa6ETyvrLamhW8Nhq1nyJF9wbWR
 3TbNIo5MqY8HNHxnQ5kyDwIHEtY4lg0T9QvQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([95.90.255.242]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MLi8g-1r6DcL1Yqe-00HbLY; Fri, 06 Oct 2023 11:02:53 +0200
From: Julian Ribbeck <julian.ribbeck@gmx.de>
To: conor@kernel.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	jernej.skrabec@gmail.com,
	julian.ribbeck@gmx.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh+dt@kernel.org,
	samuel@sholland.org,
	wens@csie.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 2/2] dt-bindings: arm: sunxi: Add itead,iteaduino-plus-a20
Date: Fri,  6 Oct 2023 11:01:31 +0200
Message-ID: <20231006090154.9289-2-julian.ribbeck@gmx.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231006090154.9289-1-julian.ribbeck@gmx.de>
References: <20230929-given-making-f3fac6afb176@spud>
 <20231006090154.9289-1-julian.ribbeck@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dX2ZJgQWe26HNpJA/KGMMbuOxe7MXG13tvQ9iSk6256OqXMTlS3
 d/0OSTiROIYwi0ShmvUmzSglQqE8uHF6UX4wEYi5WxI3G/AHneiKTqJPPqerccDCpDhX8L4
 lffpKdH6pky1918durRXMdQ5QXTsSzzCOBuuXVQ0ZnbEi9CmZzvfSwC2XW/vpR17n8zRS9V
 +X9Z6sl/TSUZpLaab53RQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jtEReDhd39k=;UK3jrypDENnCB6ecceHBAsrajL7
 hkAnp3SVw7b1d2VjbHgf4/CChLg7EkCinuuPpk2Iy5XYjBK3fBP8zOShvd/dZ1dXcK2udRufR
 2en+Q0NdAGIHBhbWGMe5CQBUmO/jhRSkqFP+SmoK3z2aPNYIz4vtMNBiEYpR3Ko8B6cnLSUKa
 Yg+jMxyrUjRkaQzFrYctNzFlJ2mrKYx0q3KRUqJ1WhDSso7j0wBdHjR/1vjaVeeYHvuk7kjJ+
 mtUy0nxGjkcQHEOTlbzapDxolm1L4pP9mcXpu6svSVXL2CZGHIP57Eg39NuQXszxRw66N9TTI
 pnNZoLenCyfwiYf42Kws+F6guSkjJjmFHujQbaSXlb01SNp3ZnRftPz+R6WS2D3x2icZVaA/U
 qqrZzcxTRZSrNd9gXr14B3QHQ6wQGeZ0HT0sq3c9eHE+9ogsEkdQtt5U9oUQoprK8hWzLSkuR
 fnRXcMOy/cSNB42BL37VIZypZonTD6S9hEQJUfPNxrIB2yrJOLkqalnBzZFL6/o8HPJqL/7vy
 T3yF7e+e2CX+u/SOtrY59CiRw6FJ5UY1e3B3arYJUNIpzJ897A9YWYuxbaTHfWmdJrk7iiU9p
 ljv8WCUMRE5HlUWnaLzg2DFptLkjyJL9IcivUxxYRlP71O/CWAEBTvEfdPyHKvRA6J90xSywo
 5tzvhdQPdZqW+ixIEj4UvjAQLJXa5FP0euoKXAqCEK+2hQCqyw0Lda2PRTVfWrvEjb2cE48vf
 RE63Dmw6IijxNYQvXgE+Nkc1S/pvms3E6KfM5ghI0JFurmSQfZseVUWkWbcHKS+g5FaRmFLDh
 ZWPhP9BfrROKVuUmi99mikdqeCEOiP/ERIX7GeAp2igN3yJO6rRhJXhmeKpoGGmNbSgok1C0t
 mJKGjL7hTHrkIkmgs+3Z34mw6WApFN5hZ4QTsUZrT/ckAcAhArkSX5wggEOdoHs+a9DiKVuAs
 RvM1gw9xbHDCFr+Qc8lA2QYAH5o=

Add itead,iteaduino-plus-a20 bindings

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Julian Ribbeck <julian.ribbeck@gmx.de>
=2D--
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentat=
ion/devicetree/bindings/arm/sunxi.yaml
index e4dd678f4212..25251ce4b60d 100644
=2D-- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -362,6 +362,11 @@ properties:
           - const: itead,iteaduino-plus-a10
           - const: allwinner,sun4i-a10

+      - description: Itead Iteaduino Plus A20
+        items:
+          - const: itead,iteaduino-plus-a20
+          - const: allwinner,sun7i-a20
+
       - description: Jesurun Q5
         items:
           - const: jesurun,q5
=2D-
2.42.0

