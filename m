Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2653C6AC
	for <linux-sunxi@lists.linux.dev>; Thu, 28 Sep 2023 16:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1695920340; x=1696525140; i=julian.ribbeck@gmx.de;
 bh=pgzYVMK04U11CH6h9Yble3k0HzNklkv+LW2WhvSCwtQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=f2lyhWCdspd+wKbQ75KGOgK9H2BAysh7G3H7H4q5NRsw1CDU59NrgcLOlyAuujx6cH2I7jSS+e5
 48WASg0xe85trvfVvXAn2sSCq/G+xzSfWwjMNFl+D0wLAuTPnsZyWen0hsezQBx7oW4A23L98JoQi
 5g6S9z1xG9B0PLKrHjk8nICYxEMPiZ0UussHPr3WtvBFSc4k+gfG399QM/j9x6Nicw/s9nUFeCWaa
 aIiL4sa7MClKDQPMNODqSz8IUcKXJZjaHk6t6pdXeyfcQf5iPmx7X0iBRIgF5UkwJkfqhYU8SF3KP
 XeqpuLXJ+wfXETjRSDSToPHmce9IV71/8jiQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([95.90.255.242]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MgvvT-1rHODW3xNt-00hPZq; Thu, 28 Sep 2023 18:59:00 +0200
From: Julian Ribbeck <julian.ribbeck@gmx.de>
To: samuel@sholland.org
Cc: conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	wens@csie.org,
	jernej.skrabec@gmail.com,
	julian.ribbeck@gmx.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	robh+dt@kernel.org
Subject: [PATCH v3 2/2] dt-bindings: arm: sunxi: Add itead,iteaduino-plus-a20
Date: Thu, 28 Sep 2023 18:57:02 +0200
Message-ID: <20230928165803.30127-2-julian.ribbeck@gmx.de>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230928165803.30127-1-julian.ribbeck@gmx.de>
References: <9730f21c-fd8e-9583-98c7-e5d923269f79@sholland.org>
 <20230928165803.30127-1-julian.ribbeck@gmx.de>
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:P+6Q2PWpdB5kQfCXWzv1Akg7Tgg17CXmpZMVE+xnoG+XKC+qYEi
 arn67oWwTWaLrbmV+qSM1U26dQhZ6tEXn2IjvF7izsPMlJp90eFa3U9e5ZJAEk+VgnG3TFq
 MjbYiExv0JQLwPVWANwRiAgH9NZ1mUwLkf8W7hiNIn0hOYpgqJDWLMvCGCH3Q3bd4V6oCiZ
 DPbZ9c5Cxhe96FPSsTlWg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jrXD7kg4Rl4=;S7cWsOJDbzTL8AZvkaDGIhjFO8F
 tFNFLuD6f8DYj2qgfP007c09yMu8PnaJlGCiYtJCqdgZc0BqNxbt6aYQoj5IxhLWJDTUeWHj7
 Eqm8Dot5KEVyD1QkVUQMiJr6H6w3RqF5HjNy/B7MG0+3X1azI+nGi2yN2tdBxngXPjI4wWZ35
 CZhJIDQtyGE8mQWvwn2D8ns7lM7qVACqWxFW4dzs9uuRcc8HMJwD5DI3BYNdEYUOWlLfTSNdm
 6Ax2GsKXazX789ncIkJjKJKSYTQaOyLikJ6lN3TqAa72FN5G+/CgZUkAQGEv+b2XzPPrIC6F4
 njn85hGp1Na8IwQ7jeW4AqyOaQXSdlpL3E5VmiX+rNB6Y5Ll0nPVOUY/LVfUIHKkFr7+w2sn8
 GMPeYZydMgtuA5VZqmwyvd5cs6B23gGyiN0itwcPlXNVgLlawss5qlc1jn/1MHKKQ5fftq9jn
 uyDGYQ0TF8GTdX09jrGPvOmzQ23j7FPpWv9g6rve5s6V59lYzn1xBR4zgjK/0vZ8fc77fA4C4
 96d0zCYEAkQ1kEeoxm05m092ftSqi9vsT128Qn7c9LfXjmrd9z7TGN061RQZy1MwEIMKOobI5
 b353Eq7Iw8BzOHnzsafruZHk0qL6fbyLqEaMfTzzH+e3m6X8l6ulPm7qpo7W+2SGGw8XRM4kO
 /R4BgPcrzf/USwzroHzHOuIX78UjQj/Xif/pemb0kanZqx2nXBudESFZ6wX7fLj5J4nViJusx
 njWZyI/ynebBXwcYH0p9199+n94xaeWz9Ms7k3ao4CQ46Ytp7hjBymFE65avJF/SNPo/CWuWu
 e1s+1fc1GFxZkGx/zpjAc0xcCL3fxKhuLKl6IY2GJnoA7say/VzyF6R2lcod+i8g69xBt9z0c
 Yb0weX9jdO7fnnuSdwA9d+qj4PXh0we8A07TBuGOgz3z36hbWqfHIqtXI5LnfmDUOsyOgJQyh
 V6FiRQ==

Add itead,iteaduino-plus-a20 bindings

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

