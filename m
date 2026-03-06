Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11513ECBDF
	for <linux-sunxi@lists.linux.dev>; Fri,  6 Mar 2026 15:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772812039; cv=none; b=aOE6BFo8Sas3ctMMZXVEhk5eztev9utckgMyGdI83Upk/9suiW8kEuggmDpHPLweSzsXwDQES4pp/pO5bMawjPLl3e0oG75C7oVxCA7IWlQr3r06kcOr4bTPgobFhYkUOFH/IuOe75qG4d6bYoqzHKGlTQSGoHrP2Dky21zOuZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772812039; c=relaxed/simple;
	bh=bEabACDPIWR1GkBjG8FezvRhDRIaJO/5uKLvE5tByvA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CPr8Cn/nNTxfXrAHCI1YxErwzjsY+OTgjSTSTkOv+iJQ/+fd/L+KUkuvXEQNVSlXyEq7QXdwKNaTP4SKpNHKmEUpWUDo/uiDBFqJD4QO7CcKXDK8304dg3xOqopl9aNMAwkU5lTt6x0ZYe/cMOSEZjGjowdcYESdZspD9R3lwwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=blZWVVFd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MzehTCmh; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="blZWVVFd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MzehTCmh"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626FT34d1130869
	for <linux-sunxi@lists.linux.dev>; Fri, 6 Mar 2026 15:47:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=; b=blZWVVFdJm5pq2s4
	PO1IoTK0oZUWN8RBadFnYGbAlc3m2nYxCCAZJoeyN8dZ2GzS0bjFpB/+/WRbRyOp
	cZpzJbPQfn7+onkLGvTUQeviugYAqHOq/E6UEdZyavJbNRK4yvXe+mYUOU7QPYb7
	d0JbnJ8/vwP1drmZ8bqjvxRL3p2PFud7Af9xu0yJEOdXGhYQ882xIq3BJHerJ0ya
	OQ6T2xzkQsIWvvryi6uV2qq00vNQNaUvC9TLAdVdndnGw3EonILWJcNmO7I7ippn
	jt1rdjFiMLsOW7gxeD34OZKDaDvhyZit9ACXtl7PpgHj6PU82Ath2n/2lmPJW0Xg
	hjUYFQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqj4sb8qp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-sunxi@lists.linux.dev>; Fri, 06 Mar 2026 15:47:13 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c71156fe09so5196517285a.0
        for <linux-sunxi@lists.linux.dev>; Fri, 06 Mar 2026 07:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772812033; x=1773416833; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=;
        b=MzehTCmhCO4ekeaOG8Xf3XbTXO6NciP9k3TkkboWSnzEbjLoVXpgtpzWVEZd0L8SDa
         H2cYGcuAw/wkQGxtcNauG0Ong1SspveDbFsO4dNzbM+Gqoyy9pdocTLoiyIFl1cbfWtV
         1Ydfu2K0yCE4R2QJn5lhBq2KuRDGKv2reKT1T4JxGr9C5V2+KOJ3PbDA0v6O1kNeP+dS
         ErgBnftnvLfHnDIIy06pZlD0xloewZlRjOcqWuEHPu/EZE5+y1xmOm/ap0/xvc1BMb67
         6KlqnHY6hlvi1cI5j4xh+X2zTg0NLbRclu9lyxIwnV8VpshpFP+ZvVFEInHH74OwKPkh
         TUgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772812033; x=1773416833;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2NRYH8lzJWLHa5JUwCNp14+Y3Xn6J7jBFL10EVR15BE=;
        b=eRkVhPzm3qUSk7e3OdqJjYCSf3sVvF0zCVUuovYC4ja1RliPzPvvp/nqtugXzdxHRC
         kuIQ5aGz4ZMigHQ+GFE6+KsbxzdQpurcMbnEznLBNHU/6HgnTI7msbNsmAnTuC49d5Xe
         eA/YAgPeoSPOAKzZAGYKEx5rcyU1/SqFCvjicK9m+mZGnEvShrszTxgfYhhQcEGQmheC
         JdsmEP6s2W87FEMR7vv9dbmTY2HdK8l45tJOG4xBbGa49SjtPNABaoke3OxF2TYSMH/+
         0bPyNylm9ISa1wzX6q9A0sU4kpd4jTNhiQgAo2bFmTVAL1h/p11TQhd1K4qoCXXtfpdb
         kyAg==
X-Forwarded-Encrypted: i=1; AJvYcCUOYAufplHGW+LdxALwCFYY5JcIgL2oCFmdgsrS0yV4TCo0bJYwR8XM2iVrGTItr7H27NcCU0gZPORH+A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxnO5SoBuCnDElaIbMT+T6FaWfJk3pAWngnj3znK0jGOwjO3Iiu
	+nGno/Flpa7y9ZziylBFogNib8rXUNUqS14kt5jQFTevey6CW7dhqbN+4La1wvxnSW5mYnwpszw
	GI5xosu5oHKILwWFKMJhmqO3L1yb7jZF9M9qTmpBMJQUgEFIIkPSQle0BM/5fgmDIEg==
X-Gm-Gg: ATEYQzycLWEXfDt5yhK1+1FLl7J2Q4VrqnzPl0quKO+QCoM/MHBBKwYkT/fYn3U1CMd
	aAHvSkZWyR58y3YS/JvoJ8VxF13IH3u0O/pn/tsnPI3LkU6MKgCKUK55ge92XWqkH1EPYDv9wxa
	4IsSUr7QzcgDImXusE6zeqhsrAM9uW4stuc0jJn4Wz2QAtTPaeI5PETNz+6igQmDdlrFTL7zK0J
	0EZhmdnwWUqbWqW39yZOaf6c4B7ffy6CCSRy+eXT43Sxh+8/CtTrJExvj2IR15kj5MxL2OenDuD
	+d8Bns4GFSzlBhAkp8YPTO+QeD2RvBXS8nMMfhOrXFKyrLXHNZKF15UzUZQ8KI02uN8T+U56veU
	zEZObPUXwHQ8M77tdRdR+kn7nm/HjbaqAFQR8pz4XxYfHUrRwZuc2
X-Received: by 2002:a05:620a:4481:b0:8b2:7777:f662 with SMTP id af79cd13be357-8cd6d52ca78mr307272285a.64.1772812032622;
        Fri, 06 Mar 2026 07:47:12 -0800 (PST)
X-Received: by 2002:a05:620a:4481:b0:8b2:7777:f662 with SMTP id af79cd13be357-8cd6d52ca78mr307261085a.64.1772812031898;
        Fri, 06 Mar 2026 07:47:11 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dae35cf7sm5122767f8f.26.2026.03.06.07.47.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 07:47:11 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 16:46:40 +0100
Subject: [PATCH net-next v7 2/7] net: stmmac: qcom-ethqos: use generic
 device properties
Precedence: bulk
X-Mailing-List: linux-sunxi@lists.linux.dev
List-Id: <linux-sunxi.lists.linux.dev>
List-Subscribe: <mailto:linux-sunxi+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-sunxi+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-qcom-sa8255p-emac-v7-2-d6a3013094b7@oss.qualcomm.com>
References: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
In-Reply-To: <20260306-qcom-sa8255p-emac-v7-0-d6a3013094b7@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Vinod Koul <vkoul@kernel.org>,
        Giuseppe Cavallaro <peppe.cavallaro@st.com>,
        Jose Abreu <joabreu@synopsys.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>,
        Matthew Gerlach <matthew.gerlach@altera.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Keguang Zhang <keguang.zhang@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Jan Petrous <jan.petrous@oss.nxp.com>, s32@nxp.com,
        Romain Gantois <romain.gantois@bootlin.com>,
        Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        Heiko Stuebner <heiko@sntech.de>, Chen Wang <unicorn_wang@outlook.com>,
        Inochi Amaoto <inochiama@gmail.com>,
        Emil Renner Berthing <kernel@esmil.dk>,
        Minda Chen <minda.chen@starfivetech.com>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>,
        Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Maxime Ripard <mripard@kernel.org>,
        Shuang Liang <liangshuang@eswincomputing.com>,
        Zhi Li <lizhi2@eswincomputing.com>,
        Shangjuan Wei <weishangjuan@eswincomputing.com>,
        "G. Jaya Kumaran" <vineetha.g.jaya.kumaran@intel.com>,
        Clark Wang <xiaoning.wang@nxp.com>, Linux Team <linux-imx@nxp.com>,
        Frank Li <Frank.Li@nxp.com>, David Wu <david.wu@rock-chips.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        Christophe Roullier <christophe.roullier@foss.st.com>,
        Swathi K S <swathi.ks@samsung.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Drew Fustini <dfustini@tenstorrent.com>, linux-sunxi@lists.linux.dev,
        linux-amlogic@lists.infradead.org, linux-mips@vger.kernel.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-rockchip@lists.infradead.org, sophgo@lists.linux.dev,
        linux-riscv@lists.infradead.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3034;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=u8u/iXjZq36K7RYc1MNw8bxCkqJ95fEzxfvBCtp9cjI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqvbryaTIb50mRpj4hrxdrase97KkN9iHxwUJp
 BlJuvI37VWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaar26wAKCRAFnS7L/zaE
 wzclD/0ZZh4K959JYxRQjHxVfznc7OkBZWgPBrYs8wAo/K3hokNK0WiKMHJZLzn2SMWtqWzVB0C
 lG0CmntJphIJ1AWgN+rXR93gl3L/sk5A6pAGK7SSpHgcKQlf8M1jF5SOdkc3uDgiPPbHCwxhOPV
 jfsOa3iwvidAeWEMmqummdnOf24q3RxuNLVYxiwqK9KQtEssdTXJFhs3HX4WSDrjs/zBKmKvWfn
 JfxMeHdfG7t91xJMf/P5Wp3DVHk5JKSvM5Lw9DE7CpH8hsz4OoZX1BZ9pxQwOeWcTQiPXheDP4H
 2uoOJ4gBkGRVCondWFER/PJsd0MdsXH5KOFfGoxuqaGdgK1Y3qqZ8vVFIxGTJSNkT4w0iZf3V+q
 w534YqTJUi3ZcbICEFTeWEJ0szhN2f2NEjKDqoPq8mJ8/FfC3bW+4fJQEhhxdpdhQWFeAW3sIC1
 Qc4NbVsTYrLkgRdSzSscY2UwVbUcqY2gpTkANq+PSasQaATRxTxNvKS0sINBmqyjUJmZB9tPw0D
 fB7ST1Lzwr8JkoDBdXDhAT3DM0FM3lJs+m8ywJMoOhaQf0+AsZ5IDwxI61znd6YAwLIw8bOQAQg
 Auc4hPSxQt6V6qfOaIm93wh6MAaEr6z5BfcPqlyr68NN61ugGkB2/8dMWzloVwETVtM1dMCmmwV
 DKcCepzLPjDweIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE0NiBTYWx0ZWRfX5YgQZ4cG8KG4
 Etjim6wZR1/FOv13gUm3bsE0km4ERPunSOZXmuriD/OIzWEM1CoOv9H14zbbnP8yoTtJX3/uFBG
 puwmTZyRsY3B5Fw3ygqXihvo66mKbTUP7ze8kraNGFJhLfII8QtHwRosCUvKyXCNXMkYhkl7NAj
 uq/w4F2tjJjUXZElBSL8e14q5fee2eVHYmpdSSfJNdFbkKSHsFJpTEooFpIosTJxe7HviKH4Qc1
 h7Z1KMhNJrgrIJX7ZNZ7Gb6rCV5Y5WEXQLwih0nWh2l5FPWHx76bCbpTksD5UkEvNjuW3QNouDU
 IysBDZ062bovCJRtK5+rb8Z3cHC8mJNhNG32tE6cx5xfkuaaK1yglnww4Lsw4e9QqEdbW7cZEZ6
 zXf3QApPocoCI0nWnCwTlLYTy7wSyBDAU1JIsON9+c+Ae1eHWNcLlDWXaYgH7D3VMQQo8PNXJni
 +vUFZdmovucP3TS5sMw==
X-Proofpoint-ORIG-GUID: n_tuSOWMwuGbOnN865wFkrvaAUXM3w-9
X-Proofpoint-GUID: n_tuSOWMwuGbOnN865wFkrvaAUXM3w-9
X-Authority-Analysis: v=2.4 cv=T8uBjvKQ c=1 sm=1 tr=0 ts=69aaf701 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=AGkLNbZTeN-MX8W9OO4A:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 adultscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060146

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

In order to drop the dependency on CONFIG_OF, convert all device property
getters from OF-specific to generic device properties and stop pulling
in any linux/of.h symbols.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/stmicro/stmmac/Kconfig             | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 9 ++++-----
 2 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/Kconfig b/drivers/net/ethernet/stmicro/stmmac/Kconfig
index 07088d03dbab5bd1abf66e9460613b839c1d565e..e2af4fdd654340d618477ed87d3889dbb9aab456 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Kconfig
+++ b/drivers/net/ethernet/stmicro/stmmac/Kconfig
@@ -135,7 +135,7 @@ config DWMAC_MESON
 config DWMAC_QCOM_ETHQOS
 	tristate "Qualcomm ETHQOS support"
 	default ARCH_QCOM
-	depends on OF && (ARCH_QCOM || COMPILE_TEST)
+	depends on ARCH_QCOM || COMPILE_TEST
 	help
 	  Support for the Qualcomm ETHQOS core.
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index af8204c0e188ca8eaa9f31abeddda607f273b4a3..219ea36fe01e6d41299649defe569de034859288 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -1,8 +1,8 @@
 // SPDX-License-Identifier: GPL-2.0
 // Copyright (c) 2018-19, Linaro Limited
 
+#include <linux/mod_devicetable.h>
 #include <linux/module.h>
-#include <linux/of.h>
 #include <linux/of_net.h>
 #include <linux/platform_device.h>
 #include <linux/phy.h>
@@ -730,7 +730,6 @@ static void ethqos_ptp_clk_freq_config(struct stmmac_priv *priv)
 
 static int qcom_ethqos_probe(struct platform_device *pdev)
 {
-	struct device_node *np = pdev->dev.of_node;
 	const struct ethqos_emac_driver_data *data;
 	struct plat_stmmacenet_data *plat_dat;
 	struct stmmac_resources stmmac_res;
@@ -779,7 +778,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	data = of_device_get_match_data(dev);
+	data = device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
 	ethqos->rgmii_config_loopback_en = data->rgmii_config_loopback_en;
@@ -816,9 +815,9 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ethqos->has_emac_ge_3)
 		plat_dat->dwmac4_addrs = &data->dwmac4_addrs;
 	plat_dat->pmt = 1;
-	if (of_property_read_bool(np, "snps,tso"))
+	if (device_property_present(dev, "snps,tso"))
 		plat_dat->flags |= STMMAC_FLAG_TSO_EN;
-	if (of_device_is_compatible(np, "qcom,qcs404-ethqos"))
+	if (device_is_compatible(dev, "qcom,qcs404-ethqos"))
 		plat_dat->flags |= STMMAC_FLAG_RX_CLK_RUNS_IN_LPI;
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;

-- 
2.47.3

